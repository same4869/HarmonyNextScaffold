
import { MarketChartComp } from './components/MarketChartComp'
import { TopIndexCardComp } from './components/TopIndexCardComp'

@Component
export struct MarketHuShenJingPage {
  build() {
    Column() {
      Scroll() {
        Row({ space: 10 }) {
          TopIndexCardComp()
          TopIndexCardComp()
          TopIndexCardComp()
          TopIndexCardComp()
          TopIndexCardComp()
        }.padding({ top: 8, bottom: 8 })
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .padding({ left: 16, right: 16, bottom: 4 })
      .edgeEffect(EdgeEffect.Spring)

      MarketChartComp()

    }.height("100%").width("100%").backgroundColor("#f4f4f4")
  }
}