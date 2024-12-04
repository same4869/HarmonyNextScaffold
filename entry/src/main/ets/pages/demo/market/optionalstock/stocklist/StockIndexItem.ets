import { StockIndexData } from '../../../model/StockIndexData'

@Component
export default struct StockIndexItem {
  stockIndex?: StockIndexData
  @Prop itemSelected: boolean = false

  build() {
    Stack({alignContent: Alignment.Bottom}) {
      Column() {
        Text(this.stockIndex?.lastPrice)
          .fontSize(18)
          .fontColor((this.stockIndex?.precent ?? 0) > 0 ? 0xEC3529 : 0x10A361)
          .margin({top: 8, left: 16})

        Row() {
          Text(this.stockIndex?.indexName)
            .fontSize(12)
            .fontColor(0x222222)

          Text((this.stockIndex?.precent ?? 0).toString())
            .fontSize(12)
            .fontColor((this.stockIndex?.precent ?? 0) > 0 ? 0xEC3529 : 0x10A361)
            .margin({left: 4})
        }
        .margin({bottom: 10, left: 16})
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(HorizontalAlign.Start)
      .height('100%')
      .width('100%')

      if (this.itemSelected) {
        Divider()
          .color(0xEC3529)
          .margin({left: 16})
          .strokeWidth(2)
          .lineCap(LineCapStyle.Round)
      }
    }
    .width('33.3%')
    .height('100%')
  }
}