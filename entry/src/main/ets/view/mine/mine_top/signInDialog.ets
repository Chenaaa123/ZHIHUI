import { CommonConstants } from "../../../common/constants/CommonConstants"

@CustomDialog
export default struct sigInDialog {
  cancel?: () => void
  confirm?: () => void
  controller: CustomDialogController
  @StorageLink('study_days') study_days: number = 0
  @State Sign_image: ResourceStr = $r('app.media.Sign_icon_No')

  build() {
    Column() {


      Row() {
        Image($r('app.media.signIn_icon')).margin({ top: 10, bottom: 10 }).width(60)
        Text('每日签到').fontSize('24').fontWeight(CommonConstants.FONT_WEIGHT_500)
      }

      Column() {
        Image(this.Sign_image)
          .width(100)
          .height(100)
          .margin({ bottom: 10 })
      }

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Image($r('app.media.no_signIn'))
          .width(30)
          .height(30)
          .fillColor('#8a8a8a')
          .onClick(() => {
            this.controller.close()
            if (this.cancel) {
              this.cancel()
            }
          })
        Image($r('app.media.is_signIn'))
          .width(30)
          .height(30)
          .fillColor('#53df5d')
          .onClick(() => {
            this.Sign_image = $r('app.media.Sign_icon_Yes')
            // this.controller.close()
            if (this.confirm) {
              this.confirm()
            }
          })
      }.margin({ bottom: 200 })
    }.height(250)
  }
}