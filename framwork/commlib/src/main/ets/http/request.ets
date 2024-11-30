//接口发送超时
import { MToast } from '../utils/MToast'
import HttpBuilder from './http'

const READ_TIMEOUT = 30000
//接口读取超时
const CONNECT_TIMEOUT = 30000

export const httpClient = new HttpBuilder({
  readTimeout: READ_TIMEOUT,
  connectTimeout: CONNECT_TIMEOUT
})

export function errorHandler(error: any) {
  if (error != undefined && error.response != undefined && error.response.status) {
    switch (error.response.status) {

      //各种通用错误码处理
    // 404请求不存在
      case 404:
        MToast.showToast("网络请求不存在")
        break;

    // 其他错误，直接抛出错误提示
      default:
        MToast.showToast(error.response.data.message)
    }
  }
}