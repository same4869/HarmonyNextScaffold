
@Component
export struct MarketChartComp {
  build() {
    Column() {
      Row() {
        Text("标题1")
          .fontSize(22)
          .fontColor($r("app.color.color_black"))
          .align(Alignment.Start)

        Text("标题2")
          .fontSize(16)
          .fontSize($r("app.color.color_777"))
          .margin({ left: 4 })

        Blank()

      }.width("100%")
    }.width("100%")
    .backgroundColor($r("app.color.color_white"))
    .borderRadius(8)
    .padding(16)
  }
}