import { MLog } from '@app/commlib';
import { webview } from '@kit.ArkWeb';
import webViewModel from '../../../../viewmodel/WebViewModel';
import { MJSInterface } from './MJSInterface';
import { WebUtil } from '../../../../utils/WebUtil';

/***
 * 基础web容器，尽可能业务无关
 */
@Component
export struct BaseWebComponent {
  webController: webview.WebviewController = new webview.WebviewController();
  // 声明需要注册的对象
  @State mJSInterface: MJSInterface = new MJSInterface();
  private src: ResourceStr = ""

  aboutToAppear() {
    webViewModel.observeState(state => {
      MLog.debug("state -> " + state)
      new WebUtil().callbackWebMethod(this.webController, state, "1111")
    })
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Web({ src: this.src, controller: this.webController })// .zoomAccess(false)
        // .javaScriptAccess(true)
        // .width('100%')
        // .height('100%')
        // .aspectRatio(1)
        // .darkMode(WebDarkMode.On)
        // .forceDarkAccess(true)
        .javaScriptProxy({
          object: this.mJSInterface,
          name: "MJSInterface",
          methodList: ["postMessage"],
          controller: this.webController
        })
    }
    .width('100%')
    .height('100%')
  }
}