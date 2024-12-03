import promptAction from '@ohos.promptAction';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { image } from '@kit.ImageKit';
import { fileIo as fs } from '@kit.CoreFileKit';
PersistentStorage.persistProp('user_name', "请输入用户名");

@Component
export default struct Leave_word {
  @Consume pageInfos: NavPathStack
  editorController = new RichEditorController()
  suggestion = new RichEditorController()
  @State getContentLength: number = 0;
  @State getContentLength1: number = 0;
  @State BOnSt:promptAction.ShowToastOptions = {'message': '已超出内容最大限制.'}

  //相册获取图片
  @State getAlbum: string = '显示相册中的图片';
  @State feedback: image.PixelMap | undefined = undefined;
  @State albumPath: string = '';
  @State photoSize: number = 0;

  async getPictureFromAlbum() {
    // 拉起相册，选择图片
    let PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
    PhotoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
    PhotoSelectOptions.maxSelectNumber = 1;
    let photoPicker = new photoAccessHelper.PhotoViewPicker();
    let photoSelectResult: photoAccessHelper.PhotoSelectResult = await photoPicker.select(PhotoSelectOptions);
    this.albumPath = photoSelectResult.photoUris[0];

    // 读取图片为buffer
    const file = fs.openSync(this.albumPath, fs.OpenMode.READ_ONLY);
    this.photoSize = fs.statSync(file.fd).size;
    console.info('Photo Size: ' + this.photoSize);
    let buffer = new ArrayBuffer(this.photoSize);
    fs.readSync(file.fd, buffer);
    fs.closeSync(file);

    // 解码成PixelMap
    const imageSource = image.createImageSource(buffer);
    console.log('imageSource: ' + JSON.stringify(imageSource));
    this.feedback = await imageSource.createPixelMap({});
  }

  build() {
    NavDestination(){
      Column() {
        RelativeContainer(){                //使用感受
          Text('使用感受')
            .offset({x:16,y:14})
            .fontSize(18)

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
            .offset({y:8})
              //  .backgroundColor(Color.Yellow)
            .alignRules({
              center: {anchor:'__container__',align:VerticalAlign.Center},
              middle: {anchor:'__container__',align:HorizontalAlign.Center}
            })
            .overlay(this.getContentLength + "/180", {
              align: Alignment.BottomEnd,
              offset:{x:-25,y:-28}
            },)
            .aboutToIMEInput((value: RichEditorInsertValue) => {
              if (this.getContentLength < 180) {
                this.getContentLength = this.getContentLength + value.insertValue.length
                console.log('实时的内容长度：' + this.getContentLength)
                return true
              }
              promptAction.showToast(this.BOnSt)
              return false
            })
            .aboutToDelete((value: RichEditorDeleteValue) => {
              this.getContentLength = this.getContentLength - value.length
              return true
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
            .alignRules({
              center: {anchor:'__container__',align:VerticalAlign.Bottom},
              middle: {anchor:'__container__',align:HorizontalAlign.End}
            })
            .offset({x:-60,y:-30})
        }.height(230)
        .width('85%')
        .borderRadius(10)
        .backgroundColor(Color.White)
        .margin({top:25})


        RelativeContainer(){           //建议
          Text('建议')
            .offset({x:16,y:14})
            .fontSize(18)

          RichEditor({controller:this.suggestion})
            .width('100%')
            .height('58%')
              //     .backgroundColor(Color.Blue)
            .alignRules({
              center: {anchor:'__container__',align:VerticalAlign.Center},
              middle: {anchor:'__container__',align:HorizontalAlign.Center}
            })
            .placeholder('您认为哪些方面需要改进以及给出您的建议',{
              fontColor:Color.Gray,
              font: {
                size: 15
              }
            })
            .offset({y:-32})
            .overlay(this.getContentLength1 + "/230", {
              align: Alignment.BottomEnd,
              offset:{x:-25,y:-28}
            },)
            .aboutToIMEInput((value: RichEditorInsertValue) => {
              if (this.getContentLength1 < 230) {
                this.getContentLength1 = this.getContentLength1 + value.insertValue.length
                console.log('实时的内容长度：' + this.getContentLength1)
                return true
              }
              promptAction.showToast(this.BOnSt)
              return false
            })
            .aboutToDelete((value: RichEditorDeleteValue) => {
              this.getContentLength1 = this.getContentLength1 - value.length
              return true
            })
          Button('一键删除', {
            buttonStyle: ButtonStyleMode.NORMAL
          })
            .height(30)
            .fontSize(13)
            .fontColor(Color.Black)
            .onClick(() => {
              this.suggestion.deleteSpans()
              this.getContentLength1 = 0
            })
            .alignRules({
              center: {anchor:'__container__',align:VerticalAlign.Bottom},
              middle: {anchor:'__container__',align:HorizontalAlign.End}
            })
            .offset({x:-60,y:-110})

          Image($r('app.media.addImage'))
            .height(70)
            .width(70)
            .fillColor($r('app.color.lightest_gray'))
            .onClick(() => {
              this.getPictureFromAlbum(); // this.feedback
              this.suggestion.addImageSpan(this.feedback,{imageStyle:{
                size: ["190px", "190px"]
              }})
              this.getContentLength1 = this.getContentLength1 + 1
            })
            .alignRules({
              center: {anchor:'__container__',align:VerticalAlign.Bottom},
              middle: {anchor:'__container__',align:HorizontalAlign.Start}
            })
            .offset({x:54,y:-52})
        }.margin({top:25})
        .width('85%')
        .backgroundColor(Color.White)
        .height('45%')
        .borderRadius(10)

        Button('点击提交')
          .fontSize(20)
          .offset({y:10})
          .width("85%")

      }.width('100%')
      .height('100%')
      .backgroundColor($r('app.color.page_background'))
    }.title('留言')
  }

}


