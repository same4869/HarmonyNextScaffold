import { axiosClient, httpClient } from '@app/commlib'
import { HomeModel } from './HomeModel'
import { HttpRequestConfig } from '@app/commlib/src/main/ets/http/http'

let baseUrl = "https://baobab.kaiyanapp.com/"
let wanAndroidUrl = "https://www.wanandroid.com/"

/**
 * 请求首页数据--系统http请求
 * @param date
 * @returns
 */
export function getHomeList(date: string = "") {
  return httpClient.get<HomeModel>({
    url: baseUrl + "api/v2/feed",
    extraData: { "date": date } as ExtraData
  })
}

interface ExtraData {
  date: string; // 或者你需要的具体类型
}

/**
 * 请求首页数据-axios客户端请求
 * @param date
 * @returns
 */

// export function getHomeListAxios(date: string = "") {
//   return axiosClient.get<HomeModel>({
//     url: baseUrl + "api/v2/feed",
//     params: { "date": date },
//     showLoading: true,
//     headers: undefined
//   })
// }