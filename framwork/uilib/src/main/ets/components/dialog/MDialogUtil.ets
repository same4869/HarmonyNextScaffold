import Context from '@ohos.app.ability.common';

/**
    @author: XWANG
    @date: 2024/1/8
    @description: 弹窗管理，尽量收口以便统一做更多事情
*/
export class MDialogUtil {
  alertDialog(context: Context.UIAbilityContext,
              titleStr: string, cancelStr: string, confirmStr: string) {
    AlertDialog.show({
      message: titleStr,
      alignment: DialogAlignment.Bottom,
      offset: {
        dx: 0,
        dy: -20
      },
      primaryButton: {
        value: cancelStr,
        action: () => {
        }
      },
      secondaryButton: {
        value: confirmStr,
        action: () => {
          // Exiting the app.
          context.terminateSelf();
        }
      }
    });
  }
}