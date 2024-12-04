
@Component
export default struct OptionalListLeftItem {

  build() {
    Column() {
      Text("元素标题").width('100%')
      Text("副标题").width('100%').fontColor(Color.Gray)
    }
    .justifyContent(FlexAlign.SpaceEvenly)
    .width('100%')
    .height('100%')
  }
}
