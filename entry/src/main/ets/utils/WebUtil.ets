import webview from '@ohos.web.webview';
/**
 @author: XWANG
 @date: 2024/1/9
 @description: 回调给H5的工具类
 */
export class WebUtil {
  callbackWebMethod(webController: webview.WebviewController, cbName: string, callbackStr: string = "") {
    if (callbackStr == "") {
      webController.runJavaScript('mWebBridge("' + cbName + '")');
    } else {
      webController.runJavaScript('mWebBridge("' + cbName + '",' + callbackStr + ')');
    }
  }
}