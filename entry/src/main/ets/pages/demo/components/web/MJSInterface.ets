import { MToast } from '@app/commlib'
import webViewModel from '../../../../viewmodel/WebViewModel'

export class MJSInterface {
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