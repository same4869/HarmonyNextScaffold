import { StockIndexData } from '../../../model/StockIndexData'
import StockIndexItem from './StockIndexItem'

@Component
export default struct StockIndexTop {
  @State stockIndexArr: StockIndexData[] = [
    {
      lastPrice: '23333',
      indexName: '标题1',
      precent: +0.14
    },
    {
      lastPrice: '34566',
      indexName: '标题2',
      precent: -0.06
    },
    {
      lastPrice: '15634',
      indexName: '标题3',
      precent: -0.45
    },
    {
      lastPrice: '123123',
      indexName: '标题4',
      precent: -0.45
    },
  ]

  @Link indexExpanded: boolean
  @State selectIndex: number | undefined = undefined
  @State showRightMore: boolean = true
  private indexScroller: Scroller = new Scroller()

  build() {
    Row({space: 9}) {
      Stack({alignContent: Alignment.End}) {
        List({scroller: this.indexScroller}) {
          ForEach(this.stockIndexArr, (stockIndex: StockIndexData, index: number) => {
            ListItem() {
              StockIndexItem({stockIndex: stockIndex, itemSelected: this.selectIndex === index})
            }
            .onClick(() => {
              if (this.selectIndex === index) {
                this.selectIndex = undefined
              } else {
                this.selectIndex = index
              }

              this.indexExpanded = this.selectIndex !== undefined && this.selectIndex >= 0
            })
          })
        }
        .listDirection(Axis.Horizontal)
        .scrollBar(BarState.Off)
        .onScroll((scrollOffset: number, scrollState: ScrollState) => {
          this.showRightMore = this.indexScroller.currentOffset().xOffset <= 0
        })

        if (this.showRightMore) {
          Image($r('app.media.hq_optional_right_more'))
            .width(10)
            .aspectRatio(1)
        }
      }
      .height('100%')
      .layoutWeight(1)

      Row() {
        this.RightButtonBuilder($r('app.media.main_tab_bottom_home_selected'), '标题1')
        this.RightButtonBuilder($r('app.media.main_tab_bottom_trade_selected'), '标题2')
      }
      .width(88)
      .height('100%')
    }
    .width('100%')
    .height(60)
  }

  @Builder RightButtonBuilder(imgSrc: Resource, title: string) {
    Button({buttonStyle: ButtonStyleMode.TEXTUAL}) {
      Column({space: 2}) {
        Image(imgSrc)
          .width(24)
          .aspectRatio(1)
          .margin({top: 8})
        Text(title)
          .fontSize(12)
          .fontColor(0x222222)
      }
      .width('100%')
      .height('100%')
    }
    .width(40)
    .height('100%')
  }
}