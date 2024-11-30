/**
 @author: XWANG
 @date: 2024/1/4
 @description: 通用loading弹窗，页面级，且会阻塞UI
 */

@CustomDialog
export struct MLoadingDialog {
  @Prop loadingTips: string
  @State rotateAngle: number = 360
  //弹窗控制器
  controller: CustomDialogController

  build() {
    Stack() {
      Column() {
        Image($r('app.media.m_loading'))
          .height($r('app.float.size_50'))
          .width($r("app.float.size_50"))
          .rotate({ angle: this.rotateAngle })
          .animation({
            duration: 500,
            iterations: -1,
            curve: Curve.Friction
          })
        Text(this.loadingTips)
          .fontSize($r('app.float.size_text_15'))
          .margin({ top: $r('app.float.size_10') })
      }
      .justifyContent(FlexAlign.Center)
      .height($r('app.float.size_150'))
      .width($r('app.float.size_150'))
      .border({ radius: $r('app.float.size_5') })
      .backgroundColor($r('app.color.color_white'))
    }
  }
}