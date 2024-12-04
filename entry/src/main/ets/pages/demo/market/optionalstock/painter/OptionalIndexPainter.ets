@Component
export default struct OptionalIndexPainter {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private timeLineContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private volumeContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  build() {
    Column({space: 7.6}) {
      Canvas(this.timeLineContext)
        .width('100%')
        .height(90)
        .onReady(() =>{
          this.timeLineContext.lineWidth = 0.5
          this.timeLineContext.strokeStyle = '#F5F6F7'
          this.timeLineContext.fillStyle = Color.Transparent

          // 分时边框
          this.timeLineContext.strokeRect(0, 0, this.timeLineContext.width, this.timeLineContext.height)

          // 分时dash
          let timeDivisionPath = new Path2D()
          timeDivisionPath.moveTo(this.timeLineContext.width * 0.5, 0)
          timeDivisionPath.lineTo(this.timeLineContext.width * 0.5, this.timeLineContext.height)

          timeDivisionPath.moveTo(this.timeLineContext.width * 0.25, 0)
          timeDivisionPath.lineTo(this.timeLineContext.width * 0.25, this.timeLineContext.height)

          timeDivisionPath.moveTo(this.timeLineContext.width * 0.75, 0)
          timeDivisionPath.lineTo(this.timeLineContext.width * 0.75, this.timeLineContext.height)

          timeDivisionPath.moveTo(0, this.timeLineContext.height * 0.25)
          timeDivisionPath.lineTo(this.timeLineContext.width, this.timeLineContext.height * 0.25)

          timeDivisionPath.moveTo(0, this.timeLineContext.height * 0.5)
          timeDivisionPath.lineTo(this.timeLineContext.width, this.timeLineContext.height * 0.5)

          timeDivisionPath.moveTo(0, this.timeLineContext.height * 0.75)
          timeDivisionPath.lineTo(this.timeLineContext.width, this.timeLineContext.height * 0.75)

          this.timeLineContext.stroke(timeDivisionPath)
        })

      Canvas(this.volumeContext)
        .width('100%')
        .height(32)
        .onReady(() => {
          this.volumeContext.lineWidth = 0.5
          this.volumeContext.strokeStyle = '#F5F6F7'
          this.volumeContext.fillStyle = Color.Transparent
          this.volumeContext.strokeRect(0, 0, this.volumeContext.width, this.volumeContext.height)

          let volumeContentPath = new Path2D()
          volumeContentPath.moveTo(this.volumeContext.width * 0.25, 0)
          volumeContentPath.lineTo(this.volumeContext.width * 0.25, this.volumeContext.height)

          volumeContentPath.moveTo(this.volumeContext.width * 0.5, 0)
          volumeContentPath.lineTo(this.volumeContext.width * 0.5, this.volumeContext.height)

          volumeContentPath.moveTo(this.volumeContext.width * 0.75, 0)
          volumeContentPath.lineTo(this.volumeContext.width * 0.75, this.volumeContext.height)

          volumeContentPath.moveTo(0, this.volumeContext.height * 0.5)
          volumeContentPath.lineTo(this.volumeContext.width, this.volumeContext.height * 0.5)
          this.volumeContext.stroke(volumeContentPath)
        })
    }
    .height(130)
    .justifyContent(FlexAlign.Start)
    .width('100%')
  }
}