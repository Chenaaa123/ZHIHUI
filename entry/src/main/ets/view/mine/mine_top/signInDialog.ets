import { CommonConstants } from "../../../common/constants/CommonConstants"

@CustomDialog
export default struct sigInDialog {
  cancel?: () => void
  confirm?: () => void
  controller: CustomDialogController
  @StorageLink('study_days') study_days: number = 0

  build() {
    Column() {
      Text('签到').fontSize(20).margin({ top: 10, bottom: 10 }).fontWeight(CommonConstants.FONT_WEIGHT_400)
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('退出')
          .onClick(() => {
            this.controller.close()
            if (this.cancel) {
              this.cancel()
            }
          }).backgroundColor(0xffffff).fontColor(Color.Black)
        Button('签到')
          .onClick(() => {
            this.controller.close()
            if (this.confirm) {
              this.confirm()
            }
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 500 })
    }.height(300)
  }
}