import { MLog, MPreferencesUtil, MToast } from '@app/commlib'
import { MLoadingDialog, MCommDialog } from '@app/uilib'
import { getHomeList, getHomeListAxios } from '../http/apiService'
import emitter from '@ohos.events.emitter'
import { loadingEvent } from '@app/commlib/src/main/ets/event/EventKey'
import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State loadingTips: string = "加载中..."
  @State loadingShow: boolean = false

  //全局的loading
  loadingDialogController: CustomDialogController = new CustomDialogController({
    builder: MLoadingDialog({ loadingTips: this.loadingTips }),
    autoCancel: true,
    gridCount: 2,
    cancel: () => {
      this.loadingShow = false
    }
  })
  @State dialogTitle: Resource = $r('app.string.dialog_about_title')
  @State dialogContent: Resource = $r('app.string.project_desc')
  dialogController: CustomDialogController = new CustomDialogController({
    builder: MCommDialog({ title: $dialogTitle, description: $dialogContent, showPositive: false })
  })
  dialogController2: CustomDialogController = new CustomDialogController({
    builder: MCommDialog({
      title: $dialogTitle,
      description: $dialogContent,
      showPositive: false,
      contentBuilder: GlobalBuilder1
    })
  })

  aboutToAppear() {
    MLog.init({
      tag: "demo2"
    })

    MLog.debug("aboutToAppear")

    emitter.on(loadingEvent, (event) => {
      if (event.data.showLoading == true && !this.loadingShow) {
        this.loadingShow = true
        this.loadingTips = event.data.loadingTips
        this.loadingDialogController.open()
      } else if (event.data.showLoading == false) {
        this.loadingDialogController.close()
        this.loadingShow = false
      }
    })
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Button("click toast").fontSize('16vp').onClick(
          () => {
            MToast.showToast("hahahah")
            this.loadingDialogController.close()
            this.loadingShow = false
          }
        )
        Row() {
          Button("save sp").fontSize('16vp').onClick(() => {
            MPreferencesUtil.put("key1", "1234")
          })
          Button("load sp").fontSize('16vp').margin('5vp').onClick(() => {
            MPreferencesUtil.get("key1").then((ret) => {
              MLog.debug("ret : %{public}s" + ret)
              this.message = ret as string
            })
          })
        }

        Row() {
          Button("showCusDia1").fontSize('16vp').onClick(() => {
            this.dialogController.open()
          })
          Button("showCusDia2").fontSize('16vp').onClick(() => {
            this.dialogController2.open()
          })
        }

        Row() {
          Button("http1").fontSize('16vp').onClick(() => {
            getHomeList().then((res) => {
              //这里比较奇怪
              //res是个string，虽然编译器能直接点出后面的值，但实际取不到，要json.parse一下
              //MLog内部应该支持object的序列号打印
              MLog.debug("HomeTag->" + res)
              MLog.debug("HomeTag->" + typeof (res))
              // @ts-ignore
              MLog.debug("HomeTag->" + JSON.stringify(JSON.parse(res)))
              // @ts-ignore
              MLog.debug("HomeTag->" + typeof (JSON.parse(res)))
              // @ts-ignore
              MLog.debug("HomeTag->" + JSON.parse(res).nextPageUrl)
            }).catch((err) => {
              MLog.error(err)
            })
          })
          Button("http2").fontSize('16vp').onClick(() => {
            getHomeListAxios().then((res) => {
              MLog.debug("HomeTag->" + res)
              MLog.debug("HomeTag->" + res.nextPageUrl)
            }).catch((err) => {
              MLog.error(err)
            })
          })
        }

        Row() {
          Button("toOtherPage").fontSize('16vp').onClick(() => {
            router.pushUrl({
              url: 'pages/OtherPage'
            }).catch((error: Error) => {
              MLog.info('IndexPage push error' + JSON.stringify(error))
            })
          })

          Button("toWebPage").fontSize('16vp').onClick(() => {
            router.pushUrl({
              url: 'pages/WebPage',
              params:{
                src: $rawfile('JSBridgeUnitTest.html')
              }

            }).catch((error: Error) => {
              MLog.info('IndexPage push error' + JSON.stringify(error))
            })
          })
        }

        Button("toDemo").fontSize('16vp').onClick(() => {
          router.pushUrl({
            url: 'pages/demo/DemoPage',
            params:{
              src: "111111"
            }

          }).catch((error: Error) => {
            MLog.info('IndexPage push error' + JSON.stringify(error))
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Builder function GlobalBuilder1() {
  Column() {
    Text('自定义dialog')
      .width(400)
      .height(50)
      .backgroundColor(Color.Green)
  }
}