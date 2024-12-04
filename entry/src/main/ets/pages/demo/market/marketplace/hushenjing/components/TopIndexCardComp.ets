
@Component
export struct TopIndexCardComp {
  build() {
    Column() {
      Text("标题1").fontSize(18)
        .padding({ top: 8, bottom: 2 })
        .fontColor($r("app.color.color_222")).align(Alignment.Center)

      Text("2730.15").fontSize(16)
        .padding({ top: 2, bottom: 2 })
        .fontColor($r("app.color.color_black")).align(Alignment.Center)

      Text("-40.59 -1.46%").fontSize(14)
        .padding({ top: 2, bottom: 4 })
        .fontColor($r("app.color.color_black")).align(Alignment.Center)
    }
    .padding(8)
    .backgroundColor($r("app.color.color_white"))
    .borderRadius(8)
  }
}