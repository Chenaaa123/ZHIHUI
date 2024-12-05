import { AddPic } from '../view/leave_word/AddPic';
import { ImageInfo } from '../model/ContentInfo';
import { promptAction } from '@kit.ArkUI';

PersistentStorage.persistProp('user_name', "请输入用户名");

@Component
export default struct Leave_word {
  @Consume pageInfos: NavPathStack
  editorController = new RichEditorController()
  suggestion = new RichEditorController()
  @State getContentLength: number = 0;
  @StorageLink('imageUriArray') imageUriArray: Array<ImageInfo> = [];

  clearImageArray() {
    this.imageUriArray = [];
    console.log('图片数组已清空');
  }

  build() {
    NavDestination() {
      Column() {
        Column() { //使用感受
          Text('使用感受')
            .fontSize(18)
            .margin({ top: 15, left: 15 })
          RichEditor({ controller: this.editorController })
            .placeholder("您整体体验下来起来感觉如何，可以具体说说是哪些方面", {
              fontColor: Color.Gray,
              font: {
                size: 14,
                weight: FontWeight.Normal,
                family: "HarmonyOS Sans",
                style: FontStyle.Normal
              }
            })
            .width('100%')
            .height('75%')
            .alignRules({
              center: { anchor: '__container__', align: VerticalAlign.Center },
              middle: { anchor: '__container__', align: HorizontalAlign.Center }
            })


          Button('一键删除', {
            buttonStyle: ButtonStyleMode.NORMAL
          })
            .height(30)
            .fontSize(13)
            .fontColor(Color.Black)
            .onClick(() => {
              this.editorController.deleteSpans()
              this.getContentLength = 0
            })
            .offset({ x: 230, y: -30 })
        }
        .height(230)
        .width('85%')
        .borderRadius(10)
        .backgroundColor(Color.White)
        .margin({ top: 25 })
        .alignItems(HorizontalAlign.Start)

        Column() { //建议
          Column() {
            Text('截图反馈&词汇投稿')
              .fontSize(18)
            Text('您认为哪些方面需要改进&请上传遗漏词汇图示')
              .fontSize(15)
              .margin({ bottom: 20, top: 5 })
              .fontColor($r('app.color.gray'))
          }.alignItems(HorizontalAlign.Start).margin({ top: 15, left: 15 })

          Row() {
            AddPic()
          }

          Button('一键删除', {
            buttonStyle: ButtonStyleMode.NORMAL
          })
            .height(30)
            .fontSize(13)
            .fontColor(Color.Black)
            .onClick(() => {
              this.clearImageArray()
            })
            .offset({ x: 230, y: 10 })

        }
        .margin({ top: 25 })
        .width('85%')
        .backgroundColor(Color.White)
        .height('45%')
        .borderRadius(10)
        .alignItems(HorizontalAlign.Start)


        Button('点击提交')
          .fontSize(20)
          .offset({ y: 10 })
          .onClick(() => {
            promptAction.showToast({
              message: '该功能正在调试，敬请期待~',
              duration: 3000, // 持续时间为3秒
            })
          })
          .width("85%")
      }
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.page_background'))
    }.title('留言')
  }
}


