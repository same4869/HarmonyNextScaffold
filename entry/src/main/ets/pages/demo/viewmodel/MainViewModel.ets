/**
 @author: XWANG
 @date: 2024/1/11
 @description: 首页vm
 */

export class MainViewModel {
  /**
   * 首页底部Tab显示数据
   */
  tabTitle = [
    {
      index: 0,
      title: "探索",
      imageActivated: $r('app.media.main_tab_bottom_home_selected'),
      imageOriginal: $r('app.media.main_tab_bottom_home')
    },
    {
      index: 1,
      title: "行情",
      imageActivated: $r('app.media.main_tab_bottom_market_selected'),
      imageOriginal: $r('app.media.main_tab_bottom_market')
    },
    {
      index: 2,
      title: "交易",
      imageActivated: $r('app.media.main_tab_bottom_trade_selected'),
      imageOriginal: $r('app.media.main_tab_bottom_trade')
    },
    {
      index: 3,
      title: "理财",
      imageActivated: $r('app.media.main_tab_bottom_finance_selected'),
      imageOriginal: $r('app.media.main_tab_bottom_finance')
    },
    {
      index: 4,
      title: "我的",
      imageActivated: $r('app.media.main_tab_bottom_mine_selected'),
      imageOriginal: $r('app.media.main_tab_bottom_mine')
    }
  ]
}

let mainViewModel = new MainViewModel();

export default mainViewModel as MainViewModel;