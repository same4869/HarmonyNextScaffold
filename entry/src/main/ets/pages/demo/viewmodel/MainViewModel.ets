/**
 @author: XWANG
 @date: 2024/1/11
 @description: 首页vm
 */
import { TabItem } from '../model/TabItem';

export class MainViewModel {

  /**
   * 首页底部Tab显示数据
   */
  tabTitle: TabItem[] = [
    {
      index: 0,
      title: "底部1",
      imageActivated: $r('app.media.main_tab_bottom_home_selected'),
      imageOriginal: $r('app.media.main_tab_bottom_home')
    },
    {
      index: 1,
      title: "底部2",
      imageActivated: $r('app.media.main_tab_bottom_market_selected'),
      imageOriginal: $r('app.media.main_tab_bottom_market')
    },
    {
      index: 2,
      title: "底部3",
      imageActivated: $r('app.media.main_tab_bottom_trade_selected'),
      imageOriginal: $r('app.media.main_tab_bottom_trade')
    },
    {
      index: 3,
      title: "底部4",
      imageActivated: $r('app.media.main_tab_bottom_finance_selected'),
      imageOriginal: $r('app.media.main_tab_bottom_finance')
    },
    {
      index: 4,
      title: "底部5",
      imageActivated: $r('app.media.main_tab_bottom_mine_selected'),
      imageOriginal: $r('app.media.main_tab_bottom_mine')
    }
  ]
}

let mainViewModel = new MainViewModel();

export default mainViewModel as MainViewModel;