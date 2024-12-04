/**
 @author: XWANG
 @date: 2024/2/2
 @description: 市场首页-整体容器
 */
import { MarketBlockPage } from './block/MarketBlockPage'
import { MarketGemPage } from './gem/MarketGemPage'
import { MarketGlobalPage } from './global/MarketGlobalPage'
import { MarketHkPage } from './hongkong/MarketHkPage'
import { MarketHuShenJingPage } from './hushenjing/MarketHuShenJingPage'
import { MarketNtbPage } from './ntb/MarketNtbPage'
import { MarketTechPage } from './tech/MarketTechPage'
import { MarketPlaceViewModel, MarketTabBean } from './viewmodel/MarketPlaceViewModel'

interface TabItem {
  name: string
  value?: number
  onAreaChange?: (area: Area) => void
}


@Component
export struct MarketPlacePage {
  @State
  sort: number | undefined = 10

  build() {
    Column() {
      Row() {
        Scroll() {
          Row() {
            ForEach(new MarketPlaceViewModel().marketTabList, (marketTabBean: MarketTabBean) => {
              this.tabBuilder({
                name: marketTabBean.name, value: marketTabBean.value,
                onAreaChange: (area) => {
                }
              })
            })
          }.padding({ left: 16, right: 16 })
        }
        .width('100%')
        .height(40)
        .scrollable(ScrollDirection.Horizontal)
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.Spring)

      }.width("100%").alignItems(VerticalAlign.Top)

      Column() {
        if (this.sort == 10) {
          MarketHuShenJingPage()
        } else if (this.sort == 20) {
          MarketBlockPage()
        } else if (this.sort == 30) {
          MarketTechPage()
        } else if (this.sort == 40) {
          MarketGemPage()
        } else if (this.sort == 50) {
          MarketNtbPage()
        } else if (this.sort == 60) {
          MarketHkPage()
        } else if (this.sort == 70) {
          MarketGlobalPage()
        } else if (this.sort == 80) {
          MarketHuShenJingPage()
        } else {
          MarketHuShenJingPage()
        }
      }
    }.height("100%").width("100%").backgroundColor("#f2f2f2")
  }

  @Builder
  tabBuilder(tab: TabItem) {
    Text(tab.name)
      .fontSize(this.sort === tab.value ? 20 : 16)
      .padding(10)
      .fontColor(this.sort === tab.value ? '#000' : '#979797')
      .alignSelf(ItemAlign.Baseline)
      .animation({
        duration: 300
      })
      .onClick((e) => {
        this.sort = tab.value
      })
      .onAreaChange((_o, n) => tab.onAreaChange && tab.onAreaChange(n))
  }
}