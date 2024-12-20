import http from '@ohos.net.http';
import { MLog } from '../log/MLog';
import { errorHandler } from "./request";

/**
 @author: XWANG
 @date: 2024/1/6
 @description: 网络请求框架，这里使用鸿蒙默认的http实现
 */

export interface BaseResponse {
  //基础API响应字段
  errorCode: number
  errorMsg: string
  //拓展xxx-API响应
}

/**
 * 接口实现类包装，例如有其他业务可以再次继承实现xxxResponse
 */
export interface ApiResponse<T = object> extends BaseResponse {
  data: T | object;
  //拓展xxx-API响应体
}

export interface HttpRequestConfig extends http.HttpRequestOptions {
  showLoading?: boolean; //是否展示请求loading
  checkResultCode?: boolean; //是否检验响应结果码
  checkLoginState?: boolean //校验用户登陆状态
  needJumpToLogin?: boolean //是否需要跳转到登陆页面
  url?: string, //请求网络链接
}

class HttpBuilder {
  httpClient: http.HttpRequest
  config: HttpRequestConfig

  constructor(options: HttpRequestConfig) {
    this.httpClient = http.createHttp()
    this.config = options
    this.setupInterceptor()
  }

  /**
   * 配置属性拦截器
   */
  setupInterceptor() {

  }

  request<T = object>(config: HttpRequestConfig): Promise<T> {
    return new Promise<T>((resolve, reject) => {
      this.httpClient.request(
        config.url,
        config,
        (error, data) => {
          if (!error) {
            resolve(data.result as T);
          } else {
            MLog.error("网络请求Request异常：", error.message)
            //如果接口404，也会走到resolve，这里后面看看如何处理
            //errorHandler(error)
            reject(error)
          }
          // 当该请求使用完毕时，调用destroy方法主动销毁x
          this.httpClient.destroy()
        }
      )
    })
  }

  get<T = object>(config: HttpRequestConfig): Promise<T> {
    return this.request({
      showLoading: config.showLoading,
      checkResultCode: config.checkResultCode,
      checkLoginState: config.checkLoginState,
      needJumpToLogin: config.needJumpToLogin,
      url: config.url,
      method: http.RequestMethod.GET
    })
  }

  post<T = object>(config: HttpRequestConfig): Promise<T> {
    return this.request({
      showLoading: config.showLoading,
      checkResultCode: config.checkResultCode,
      checkLoginState: config.checkLoginState,
      needJumpToLogin: config.needJumpToLogin,
      url: config.url,
      method: http.RequestMethod.POST
    })
  }
}

export default HttpBuilder