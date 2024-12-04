
@Component
export struct MarketTechPage {
  build() {
    Column(){
      Text("标题蓝色").fontSize(15)
        .height(50)
        .fontWeight(500)
        .textAlign(TextAlign.Center)
    }.height("100%").width("100%").backgroundColor("#1491d9")
  }
}