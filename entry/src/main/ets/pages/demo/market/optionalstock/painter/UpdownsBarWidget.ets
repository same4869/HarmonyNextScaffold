@Component
export default struct UpdownsBarWidget {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  @State upCount: number = 0
  @State flatCount: number = 0
  @State downCount: number = 0

  aboutToAppear(): void {
    this.upCount = 40
    this.flatCount = 50
    this.downCount = 50

    this.context.restore()
  }

  build() {
    Canvas(this.context)
      .width('100%')
      .height('100%')
      .onReady(() => {
        if (this.upCount === 0 && this.downCount === 0 && this.flatCount === 0 ||
          this.upCount != 0 && this.downCount == 0 && this.flatCount == 0 ||
          this.downCount !== 0 && this.upCount === 0 && this.flatCount === 0 ||
          this.flatCount !== 0 && this.upCount === 0 && this.downCount == 0) {
          // 只展示一条线
          this.drawOneLine()
        } else if (this.upCount !== 0 && this.downCount !== 0 && this.flatCount === 0 ||
          this.upCount !== 0 && this.flatCount !== 0 && this.downCount === 0 ||
          this.downCount !== 0 && this.flatCount !== 0 && this.upCount === 0) {
          // 展示两条线
          this.drawTwoLine()
        } else {
          // 展示三条线
          this.drawThreeLine()
        }
      })
  }

  // 画一条线
  private drawOneLine() {
    let stockColor: ResourceColor = Color.Transparent
    if (this.upCount != 0) {
      // 只有涨家数
      stockColor = '#EC3529'
    } else if (this.downCount !== 0) {
      // 只有下跌家数
      stockColor = '#10A361'
    } else if (this.flatCount !== 0) {
      // 只有平盘家数
      stockColor = '#999999'
    } else {
      stockColor = '#F5F6F7'
    }

    // 获取线宽(当前context高度)
    let lineWidth = this.context.height

    this.context.beginPath()
    this.context.strokeStyle = stockColor
    this.context.lineWidth = lineWidth
    this.context.lineCap = 'round'
    this.context.moveTo(lineWidth * 0.5, this.context.height * 0.5)
    this.context.lineTo(this.context.width - lineWidth * 0.5, this.context.height * 0.5)
    this.context.stroke()
  }

  // 画两条线
  private drawTwoLine() {
    let leftCount = 0
    let rightCount = 0
    let leftColor: ResourceColor = Color.Transparent
    let rightColor: ResourceColor = Color.Transparent
    if (this.flatCount === 0) {
      leftCount = this.upCount
      rightCount = this.downCount
      leftColor = '#EC3529'
      rightColor = '#10A361'
    } else if (this.downCount === 0) {
      leftCount = this.upCount
      rightCount = this.flatCount
      leftColor = '#EC3529'
      rightColor = '#999999'
    } else {
      leftCount = this.flatCount
      rightCount = this.downCount
      leftColor = '#999999'
      rightColor = '#10A361'
    }

    // 三者的总数量
    let allCount = this.upCount + this.flatCount + this.downCount
    let layerHeight = this.context.height
    // 水平条段的圆角
    let layerRadius = layerHeight * 0.5;
    let layerGap = 2;

    let maxWidth = this.context.width - 2 * layerGap;
    let leftWidth = (maxWidth * leftCount) / allCount;
    let rightWidth = (maxWidth * rightCount) / allCount;
    // 需要给一个默认的宽度，否则圆角可能显示的不好看
    if (leftWidth < layerRadius) {
        leftWidth = layerRadius;
        rightWidth = maxWidth - leftWidth;
    }
    if (rightWidth < layerRadius) {
        rightWidth = layerRadius;
        leftWidth = maxWidth - rightWidth;
    }

    // 左边分段条的起始点
    let leftStartX = layerRadius;
    let leftPath = new Path2D()
    this.context.lineCap ='round'
    leftPath.moveTo(leftStartX, 0)
    leftPath.lineTo(leftStartX + leftWidth, 0)
    leftPath.lineTo(leftStartX + leftWidth - layerRadius, layerHeight)
    leftPath.lineTo(leftStartX, layerHeight)
    // 画左边的半圆
    leftPath.arc(leftStartX, layerHeight * 0.5, layerRadius, 90, 3 * 90, false)
    leftPath.closePath()

    this.context.beginPath()
    this.context.fillStyle = leftColor
    this.context.fill(leftPath)

    // 右边分段条的起始点
    let rightStartX = leftStartX + leftWidth + layerGap
    let rightPath = new Path2D()
    rightPath.moveTo(rightStartX, 0)
    rightPath.lineTo(rightStartX + rightWidth - layerRadius, 0)
    rightPath.arc(rightStartX + rightWidth - layerRadius, layerHeight * 0.5, layerRadius, 3 * 90, 90, false)
    rightPath.lineTo(rightStartX - layerRadius, layerHeight)
    rightPath.closePath()

    this.context.beginPath()
    this.context.fillStyle = rightColor
    this.context.fill(rightPath)
  }

  private drawThreeLine() {
    let layerGap = 4;
    let maxWidth = this.context.width - 4 * layerGap;
    let allCount:number = this.upCount + this.downCount + this.flatCount

    // 水平条段的圆角
    let layerRadius = this.context.height * 0.5;
    // 上涨家数水平条的宽度
    let upWidth = (maxWidth * this.upCount) / allCount;
    // 下跌家数水平条的宽度
    let downWidth = (maxWidth * this.downCount) / allCount;
    // 平盘家数水平条的宽度
    let flatWidth = (maxWidth *  this.flatCount) / allCount;

    let layerHeight = this.context.height

    // 需要给一个默认的宽度，否则圆角可能显示的不好看
    if (upWidth < layerHeight) {
      // 上涨的宽度如果小于默认宽度
      upWidth = layerHeight;
      if (downWidth < layerHeight) {
        // 下跌的宽度如果小于默认宽度
        downWidth = layerHeight;
        flatWidth = maxWidth - upWidth - downWidth;
      } else if (flatWidth < layerHeight) {
        // 平盘的宽度如果小于默认宽度
        flatWidth = layerHeight;
        downWidth = maxWidth - upWidth - flatWidth;
      } else {
        // 下跌的宽度和平盘的宽度需要根据去掉默认上涨的宽度后所占的比值
        downWidth = (this.downCount * (maxWidth - upWidth)) / (this.downCount + this.flatCount);
        flatWidth = (this.flatCount * (maxWidth - upWidth)) / (this.downCount + this.flatCount);
      }
    }
    if (downWidth < layerHeight) {
      downWidth = layerHeight;
      if (upWidth < layerHeight) {
        upWidth = layerHeight;
        flatWidth = maxWidth - upWidth - downWidth;
      } else if (flatWidth < layerHeight) {
        flatWidth = layerHeight;
        upWidth = maxWidth - downWidth - flatWidth;
      } else {
        upWidth = (this.upCount * (maxWidth - downWidth)) / (this.upCount + this.flatCount);
        flatWidth = (this.flatCount * (maxWidth - downWidth)) / (this.upCount + this.flatCount);
      }
    }
    if (flatWidth < layerHeight) {
      flatWidth = layerHeight;
      if (upWidth < layerHeight) {
        upWidth = layerHeight;
        downWidth = maxWidth - upWidth - flatWidth;
      } else if (downWidth < layerHeight) {
        downWidth = layerHeight;
        upWidth = maxWidth - flatWidth - downWidth;
      } else {
        upWidth = (this.upCount * (maxWidth - flatWidth)) / (this.upCount + this.downCount);
        downWidth = (this.downCount * (maxWidth - flatWidth)) / (this.upCount + this.downCount);
      }
    }

    // 上涨家数水平条左上方的起始点的X坐标
    let upStartX = layerRadius;
    let upPath = new Path2D()
    upPath.moveTo(upStartX, 0)
    upPath.lineTo(upStartX + upWidth - layerRadius * 0.5, 0)
    // 上涨家数水平条右上角小圆弧的中心点
    upPath.arc(upStartX + upWidth - layerRadius * 0.5, layerRadius * 0.5, layerRadius * 0.5,  3 * 90, 0, false)
    upPath.lineTo(upStartX + upWidth - layerRadius * 0.5, layerHeight - layerRadius * 0.5)
    // 上涨家数水平条右下角小圆弧的中心点
    upPath.arc(upStartX + upWidth - layerRadius, layerHeight - layerRadius/2, layerRadius/2, 0, 90, false)
    upPath.lineTo(upStartX - layerRadius, layerHeight)
    // 添加左边的半圆弧线
    upPath.arc(upStartX, layerRadius, layerRadius, 90, 3 * 90, false)
    upPath.closePath()

    this.context.beginPath()
    this.context.fillStyle = '#EC3529'
    this.context.fill(upPath)

    // 平盘家数水平条左上方的起始点的X坐标
    let flatStartX = upStartX + upWidth + layerGap;
    let flatPath = new Path2D()
    flatPath.moveTo(flatStartX, 0)
    flatPath.lineTo(flatStartX + flatWidth - layerRadius * 0.5, 0)
    // 平盘家数水平条右上角小圆弧的中心点
    flatPath.arc(flatStartX + flatWidth - layerRadius * 0.5, layerRadius * 0.5, layerRadius * 0.5, 3 * 90, 0, false)
    flatPath.lineTo(flatStartX + flatWidth - layerRadius * 0.5, layerHeight - layerRadius * 0.5)
    // 平盘家数水平条右下角小圆弧的中心点
    flatPath.arc(flatStartX + flatWidth - layerRadius, layerHeight - layerRadius * 0.5, layerRadius * 0.5, 0, 90, false)
    flatPath.lineTo(flatStartX - layerRadius * 0.5, layerHeight)
    // 平盘家数水平条左下角小圆弧的中心点
    flatPath.arc(flatStartX - layerRadius* 0.5, layerHeight - layerRadius * 0.5,layerRadius * 0.5, 90, 180, false)
    flatPath.lineTo(flatStartX - layerRadius * 0.5, layerRadius * 0.5)

    // 平盘家数水平条左上角小圆弧的中心点
    flatPath.arc(flatStartX, layerRadius * 0.5, layerRadius * 0.5, 180, 3 * 90, false)
    flatPath.closePath()

    this.context.beginPath()
    this.context.fillStyle = '#999999'
    this.context.fill(flatPath)

    // 下跌家数水平条
    let downStartX = flatStartX + flatWidth + layerGap;
    let downPath = new Path2D()
    downPath.moveTo(downStartX, 0)
    downPath.lineTo(downStartX + downWidth - layerRadius, 0)
    // 下跌家数水平条右半圆的中心点
    downPath.arc(downStartX + downWidth - layerRadius, layerRadius, layerRadius, 3 * 90, 90, false)
    downPath.lineTo(downStartX - layerRadius * 0.5, layerHeight)
    // 下跌家数水平条左下角小圆弧的中心点
    downPath.arc(downStartX - layerRadius * 0.5, layerHeight - layerRadius * 0.5, layerRadius * 0.5, 90, 180, false)
    downPath.lineTo(downStartX - layerRadius, layerHeight - layerRadius * 0.5)
    // 下跌家数水平条左上角小圆弧的中心点
    downPath.arc(downStartX, layerRadius * 0.5, layerRadius * 0.5, 180, 3 * 90, false)
    downPath.closePath()

    this.context.beginPath()
    this.context.fillStyle = '#10A361'
    this.context.fill(downPath)
  }
}