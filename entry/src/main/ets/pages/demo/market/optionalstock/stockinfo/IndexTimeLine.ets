import OptionalIndexPainter from '../painter/OptionalIndexPainter'
import TimeLinePainter from '../painter/TimeLinePainter'

@Component
export default struct IndexTimeLine {
  build() {
    Stack({alignContent: Alignment.TopStart}) {
      OptionalIndexPainter()
      TimeLinePainter()
    }
    .margin({top: 6, left: 12})
    .layoutWeight(1)
    .height(130)
  }
}