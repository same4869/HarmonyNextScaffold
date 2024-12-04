@Component
export default struct TimeLinePainter {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  build() {
    Canvas(this.context)
      .width('100%')
      .height(90)
      .onReady(() => {
        this.context.moveTo(0, 0)
        this.context.lineTo(this.context.width, this.context.height)
        this.context.strokeStyle = Color.Red

        this.context.stroke()
      })
  }
}