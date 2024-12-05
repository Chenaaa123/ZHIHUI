import { promptAction } from "@kit.ArkUI"

@CustomDialog
export default struct shareDialog {
  controller?: CustomDialogController

  @Styles
  fancy() {
    .width(60).height(60).margin({ left: 10, right: 10 })
  }

  build() {
    Column() {
      Column() {
        Text('立即分享给好友').fontSize(16).margin({ top: 20, bottom: 20 })
        Row() {
          Column() {
            Image($r('app.media.wechat')).fancy()
            Text('微信')
          }

          Column() {
            Image($r('app.media.QQ')).fancy()
            Text('QQ')
          }

          Column() {
            Image($r('app.media.microblog')).fancy()
            Text('微博')
          }

          Column() {
            Image($r('app.media.link')).fancy()
            Text('复制链接')
          }
        }
        .onClick(() => {
          promptAction.showToast({
            message: '该功能正在调试，敬请期待~',
            duration: 3000, // 持续时间为3秒
          })
        })
        .justifyContent(FlexAlign.SpaceEvenly)
      }.backgroundColor(Color.White).width('100%').margin({ bottom: 8 })

      Button('取消', { type: ButtonType.Normal })
        .width('100%')
        .height(50)
        .backgroundColor(Color.White)
        .fontColor(Color.Black)
        .onClick(() => {
          if (this.controller) {
            this.controller.close();
          }
        })
    }.backgroundColor($r('app.color.lightest_gray'))
  }
}