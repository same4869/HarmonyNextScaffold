
import StockListView from './components/StockListView'
import StockIndexInfo from './stocklist/StockIndexInfo'
import StockIndexTop from './stocklist/StockIndexTop'

@Component
export struct OptionalStockPage {
  @State indexExpanded: boolean = false

  build() {
    Column() {

      Column() {
        StockIndexTop({ indexExpanded: $indexExpanded })

        if (this.indexExpanded) {
          StockIndexInfo()
        }
      }
      .backgroundColor(0xFFFFFF)
      .borderRadius(10)

      StockListView()
        .margin({ top: 10 })
        .backgroundColor(0xFFFFFF)
        .borderRadius(10)
        .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xF2F4F7)
  }
}