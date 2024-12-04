
@Component
export struct MarketGlobalPage {
  build() {
    Column(){
      Text("标题红色").fontSize(15)
        .height(50)
        .fontWeight(500)
        .textAlign(TextAlign.Center)
    }.height("100%").width("100%").backgroundColor("#ff0000")
  }
}