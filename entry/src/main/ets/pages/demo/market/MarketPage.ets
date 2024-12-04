/**
 @author: XWANG
 @date: 2024/1/11
 @description: 行情
 */
import { MarketPlacePage } from './marketplace/MarketPlacePage'
import { OptionalStockPage } from './optionalstock/OptionalStockPage'

interface TabItem {
  name: string
  value?: number
  onAreaChange?: (area: Area) => void
}

@Component
export struct MarketPage {
  @State
  sort: number | undefined = 30

  build() {
    Column() {
      Row() {
        Row() {
          this.tabBuilder({
            name: '自选', value: 30,
            onAreaChange: (area) => {
            }
          })
          this.tabBuilder({ name: '市场' })
        }
        .width('100%')
        .padding({ left: 16, right: 16 })
        .height(40)
        .backgroundColor(0xF2F4F7)
      }.width("100%").alignItems(VerticalAlign.Top)

      Column() {
        if (this.sort == 30) {
          OptionalStockPage()
        } else {
          MarketPlacePage()
        }
      }
      .layoutWeight(1)
    }.height("100%").width("100%").backgroundColor("#ffffff")
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