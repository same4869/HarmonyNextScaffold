import { CommonConstants } from './constants/CommonConstants'
import { FinancePage } from './finance/FinancePage'
import { HomePage } from './home/HomePage'
import { MarketPage } from './market/MarketPage'
import { MinePage } from './mine/MinePage'
import { TabItem } from './model/TabItem'
import { TradePage } from './trade/TradePage'
import mainViewModel from './viewmodel/MainViewModel'

@Entry
@Component
struct DemoPage {
  @State selectedIndex: number = 0
  @Provide homeTabSelected: number = 0

  build() {
    Column() {
      Tabs({
        index: this.selectedIndex,
        barPosition: BarPosition.End
      }) {
        TabContent() {
          HomePage()
        }.tabBar(this.TabBottom(mainViewModel.tabTitle[0], 0))

        TabContent() {
          MarketPage()
        }
        .tabBar(this.TabBottom(mainViewModel.tabTitle[1], 1))

        TabContent() {
          TradePage()
        }
        .tabBar(this.TabBottom(mainViewModel.tabTitle[2], 2))

        TabContent() {
          FinancePage()
        }
        .tabBar(this.TabBottom(mainViewModel.tabTitle[3], 3))

        TabContent() {
          MinePage()
        }
        .tabBar(this.TabBottom(mainViewModel.tabTitle[4], 4))
      }
      .barMode(BarMode.Fixed)
      .barWidth('100%')
      .scrollable(false)
      .barHeight($r('app.float.size_56'))
      .onChange((index: number) => {
        this.selectedIndex = index;
        this.homeTabSelected = index
      })

    }
  }

  @Builder TabBottom(item: TabItem, index: number) {
    Column() {
      Image(this.selectedIndex == index ? item.imageActivated : item.imageOriginal)
        .height($r('app.float.size_21'))
        .width($r('app.float.size_21'))
        .margin({
          top: $r('app.float.size_8'),
          bottom: $r('app.float.size_5')
        })
      Text(item.title)
        .width(CommonConstants.FULL_WIDTH_PERCENT)
        .height($r('app.float.size_14'))
        .fontSize($r('app.float.size_text_10'))
        .fontWeight(CommonConstants.TAB_ITEM_FONT_WEIGHT)
        .fontColor(this.selectedIndex === index ? $r('app.color.color_red') : Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({
          bottom: $r('app.float.size_7')
        })
    }.justifyContent(FlexAlign.Center)
    .height(CommonConstants.FULL_HEIGHT_PERCENT)
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .backgroundColor($r("app.color.color_white"))
  }
}