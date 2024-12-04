/**
 * 展示Loading的Event
 * @param showLoading
 * @param "
 * @returns
 */
import { emitter } from '@kit.BasicServicesKit';

export function LoadingDialogEvent(showLoading: boolean, loadingTips: string = "加载中...") {
  let eventData: emitter.EventData = {
    data: {
      "showLoading": showLoading,
      "loadingTips": loadingTips
    }
  };
  return eventData
}
