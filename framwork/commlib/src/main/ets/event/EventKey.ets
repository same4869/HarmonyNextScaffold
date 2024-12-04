/**
 * 事件的EventNum
 */
export class EventKeys {
  //展示loading的事件处理EventID
  static readonly LOADING_DIALOG_EVENT = 0x10000
}

class A {
  eventId: number = 0
}

/**
 * 对应的事件，全局loading相关
 */
export const loadingEvent: A = {
  eventId: EventKeys.LOADING_DIALOG_EVENT
}