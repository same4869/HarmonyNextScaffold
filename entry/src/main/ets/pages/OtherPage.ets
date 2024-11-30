import { MDialogUtil } from '@app/uilib/src/main/ets/components/dialog/MDialogUtil'
import Context from '@ohos.app.ability.common';

@Entry
@Component
struct OtherPage {
  build() {
    Stack() {
      Image($r('app.media.app_icon')).objectFit(ImageFit.ScaleDown).onClick(() => {
        let context = getContext(this) as Context.UIAbilityContext;
        MDialogUtil.prototype.alertDialog(context, "标题", "取消", "确认")
      })
    }.width('100%').height('100%')
  }
}