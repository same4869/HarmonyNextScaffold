import { MLog } from '@app/commlib'
/**
 @author: XWANG
 @date: 2024/2/26
 @description: 自选股首页，联动滑动的列表
 */
import { OpListDataBean, OptionalStockViewModel } from '../viewmodel/OptionalStockViewModel'
import OptionalListLeftItem from './OptionalListLeftItem'

let vm: OptionalStockViewModel = new OptionalStockViewModel()

@Component
export default struct StockListView {
  private leftScroller: Scroller = new Scroller()
  private rightScroller: Scroller = new Scroller()

  aboutToAppear() {

  }

  build() {
    Row() {
      List({scroller: this.leftScroller}) {
        ForEach(new OptionalStockViewModel().opTestDataList, (item: OpListDataBean) => {
          ListItem() {
            OptionalListLeftItem()
              .width('100%')
              .height(60)
          }
        })
      }
      .onScrollFrameBegin((offset: number) => {
          this.rightScroller.scrollBy(0, offset)
        return { offsetRemain: offset };
      })
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.None)
      .width(130)
      .height('100%')

      Scroll() {
        List({scroller: this.rightScroller}) {
          ForEach(new OptionalStockViewModel().opTestDataList, (item: OpListDataBean) => {
            ListItem() {
              Row() {
                Text(item.newPrice).width(75).textAlign(TextAlign.Center).fontColor(Color.Red)
                Text(item.priceRange).width(75).textAlign(TextAlign.Center).fontColor(Color.Red)
                Text(`第三列`).width(75).textAlign(TextAlign.Center).fontColor(Color.Green)
                Text(`第四列`).width(75).textAlign(TextAlign.Center)
                Text(`第五列`).width(75).textAlign(TextAlign.Center).fontColor(Color.Green)
                Text(`第六列`).width(75).textAlign(TextAlign.Center)
                Text(`第七列`).width(75).textAlign(TextAlign.Center)
              }
              .height(60)
            }
          })
        }
        .onScrollFrameBegin((offset: number) => {
            this.leftScroller.scrollBy(0, offset)

          return { offsetRemain: offset };
        })
        .width(525)
        .height('100%')
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.None)
      }
      .scrollBar(BarState.Off)
      .layoutWeight(1)
      .scrollable(ScrollDirection.Horizontal)
      .height('100%')
    }
    .width("100%")
    .height("100%")
  }
}
