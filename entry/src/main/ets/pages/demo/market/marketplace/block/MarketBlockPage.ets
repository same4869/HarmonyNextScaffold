
@Component
export struct MarketBlockPage {
  build() {
    Column(){
      Text("标题紫色").fontSize(15)
        .height(50)
        .fontWeight(500)
        .textAlign(TextAlign.Center)
    }.height("100%").width("100%").backgroundColor("#9411d9")
  }
}