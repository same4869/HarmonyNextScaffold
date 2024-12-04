import dataPreferences from '@ohos.data.preferences'

/**
 @author: XWANG
 @date: 2024/1/4
 @description:全局preferences，KV持久化存储
 相关文档https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-data-preferences-0000001427745052-V3#ZH-CN_TOPIC_0000001573928817__preferences
 */

//默认key
const defaultPreferenceName = "M_PREFERENCES"
//支持的存取类型
type ValueType = number | string | boolean | Array<number> | Array<string> | Array<boolean>;

export class MPreferencesUtil {
  private constructor() {
  }

  static readonly context = getContext();

  /**
   * 获取Prefer实例
   * @param preferenceName
   * @returns
   */
  static async getPreferences(preferenceName: string = defaultPreferenceName) {
    return await dataPreferences.getPreferences(MPreferencesUtil.context, preferenceName)
  }

  static async put(key: string, value: ValueType, preferenceName: string = defaultPreferenceName) {
    // 获取实例
    let preferences = await MPreferencesUtil.getPreferences(preferenceName)
    preferences.put(key, value)
  }
  /**
   * 获取值
   * 这里返回的是一个promise，可之前安卓SP有些差异，注意使用姿势和回调地狱
   * @param key
   * @param defaultValue
   * @param preferenceName
   * @returns
   */
  static async get(key: string, defaultValue: ValueType = "", preferenceName: string = defaultPreferenceName) {
    // 获取实例
    let preferences = await MPreferencesUtil.getPreferences(preferenceName)
    return preferences.get(key, defaultValue)
  }

  /**
   * 删除值
   * @param key
   * @param preferenceName
   * @returns
   */
  static async delete(key: string, preferenceName: string = defaultPreferenceName) {
    let preferences = await MPreferencesUtil.getPreferences(preferenceName)
    return await preferences.delete(key)
  }

  /**
   * 清空
   * @param preferenceName
   * @returns
   */
  static async clear(preferenceName: string = defaultPreferenceName) {
    let preferences = await MPreferencesUtil.getPreferences(preferenceName)
    return await preferences.clear()
  }

  /**
   * 检查
   * @param preferenceName
   * @returns
   */
  static async has(key: string, preferenceName: string = defaultPreferenceName) {
    let preferences = await MPreferencesUtil.getPreferences(preferenceName)
    return await preferences.has(key)
  }
}