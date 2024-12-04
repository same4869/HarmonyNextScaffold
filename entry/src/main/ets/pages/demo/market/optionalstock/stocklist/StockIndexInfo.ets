import IndexTimeLine from '../stockinfo/IndexTimeLine'
import StockHandicap from '../stockinfo/StockHandicap'

@Component
export default struct StockIndexInfo {
  build() {
    Flex({direction: FlexDirection.RowReverse}) {
      StockHandicap()
      IndexTimeLine()
    }
    .width('100%')
    .height(159)
  }
}