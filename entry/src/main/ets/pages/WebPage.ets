import { MToast } from '@app/commlib/src/main/ets/utils/MToast';
import router from '@ohos.router'
import webview from '@ohos.web.webview';
import webViewModel from '../viewmodel/WebViewModel';
import { MLog } from '@app/commlib/src/main/ets/log/MLog';
import { WebUtil } from '../utils/WebUtil';

@Entry
@Component
struct WebPage {
  webController: webview.WebviewController = new webview.WebviewController();
  @State params: object = router.getParams();

  // 声明需要注册的对象
  @State mJSInterface: MJSInterface = new MJSInterface();

  aboutToAppear() {
    webViewModel.observeState(state => {
      MLog.debug("state -> " + state)
      new WebUtil().callbackWebMethod(this.webController, state, "1111")
    })
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column() {
        Row() {
          Image($r('app.media.ic_public_back'))
            .width('5.6%')
            .height('32%')
            .margin({ left: '7.2%' })
            .onClick(() => {
              router.back()
            })
          Text('web页面')
            .fontSize(20)
            .width('82.2%')
            .height('50%')
            .margin({ left: '5%' })

        }.height('7.2%')

        Web({ src: this.params['src'], controller: this.webController })
          // .zoomAccess(false)
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
    }.width('100%')
    .height('100%')
  }

  callbackWebMethod(cbName: string) {
    this.webController.runJavaScript(cbName + '()');
  }
}

class MJSInterface {
  constructor() {
  }

  postMessage(msg: string) {
    MToast.showToast("postMessage->" + msg)

    let msgBean: PostMessageModel = JSON.parse(msg)
    switch (msgBean.method) {
      case "getUserInfo":
        webViewModel.dispatchState(msgBean.callback)
        break
    }
  }
}

export interface PostMessageModel {
  method: string;
  callback: string;
}
