import UpdownsBarWidget from '../painter/UpdownsBarWidget'

@Component
export default struct StockHandicap {
  build() {
    Column({space: 8}) {
      this.StockHandicapItem('标题111', '2905.97')
      this.StockHandicapItem('标题112', '2.75')
      this.StockHandicapItem('标题113', '1517', '#EC3529')
      this.StockHandicapItem('标题114', '686', '#10A361')
      this.StockHandicapItem('标题115', '162', '#999999')

      UpdownsBarWidget()
        .width('100%')
        .height(4)
    }
    .width(124)
    .height('100%')
    .padding({top: 10, left: 12, right: 12})
  }

  @Builder StockHandicapItem(title: string, value: string, color: ResourceColor = '#222222') {
    Row() {
      Text(title)
        .fontSize(12)
        .fontColor('#666666')

      Blank()

      Text(value)
        .fontSize(12)
        .fontColor(color)
    }
    .width('100%')
    .height(17)
  }
}