import { CommonConstants } from '../../common/constants/CommonConstants'
import mine_bottom from './mine_bottom';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { image } from '@kit.ImageKit';
import { fileIo as fs } from '@kit.CoreFileKit';
PersistentStorage.persistProp('user_name', "请输入用户名");
@Component
export default  struct mine_top{

  @StorageLink("persistedMapString") persistedMapString: Map<number, string> = new Map<number, string>([])
  @Consume pageInfos: NavPathStack;
  @StorageLink('user_name') user_name: string = '用户'

  //相册获取头像
  @State getAlbum: string = '显示相册中的图片';
  @State pixel: image.PixelMap | undefined = undefined;
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
    this.pixel = await imageSource.createPixelMap({});
  }
  //

  build() {
    NavDestination(){
    Column() {
      RelativeContainer() {
        /*  用户登录     */
        //头像
        Column(){
          Image(this.pixel || $r('app.media.user'))
            .height(60)
            .width(60)
            .margin({top:80})
            .borderRadius(50)
            .onClick(() => {
              this.getPictureFromAlbum();
            })

          //用户名
          Row(){
            TextInput({placeholder: this.user_name})
              .backgroundColor(Color.White)
              .width('auto')
              .height(35)
              .fontSize(16)
              .margin({ top: 10 })
              .textAlign(TextAlign.Center)
              .fontColor($r('app.color.light_gray'))
              .borderRadius(5)//设置圆角
              .onChange((value: string) => {
                this.user_name = value;
              })
          }
        }
        .alignRules({
          middle: { anchor: '__container__', align: HorizontalAlign.Center },
          center: { anchor: '__container__', align: VerticalAlign.Top }
        })
      }
      .width('100%')
      .height(120)


      /*  center     */

      RelativeContainer() {
        Text('学习天数')
          .textAlign(TextAlign.Center)
          .fontSize(20)
          .alignRules({
            center : {anchor: '__container__', align: VerticalAlign.Center}
          })
          .offset({x:20,y:-15})
          .width('30%')

        Text('66')
          .fontSize(20)
          .textAlign(TextAlign.Center)
          .fontColor($r('app.color.gray'))
          .alignRules({
            center : {anchor: '__container__', align: VerticalAlign.Center}
          })
          .offset({x:20,y:20})
          .width('30%')


        Text('收藏词汇')
          .textAlign(TextAlign.Center)
          .fontSize(20)
          .alignRules({
            center : {anchor: '__container__', align: VerticalAlign.Center},
            end : {anchor: '__container__',align:HorizontalAlign.End}
          })
          .offset({x:-20,y:-15})
          .width('30%')

        Text(`${this.persistedMapString.size}`)
          .textAlign(TextAlign.Center)
          .fontSize(20)
          .fontColor($r('app.color.gray'))
          .alignRules({
            center : {anchor: '__container__', align: VerticalAlign.Center},
            end : {anchor: '__container__',align:HorizontalAlign.End}
          })
          .offset({x:-20,y:20})
          .width('30%')
          .onClick(() => {
            this.pageInfos.pushPath({ name:'Collect_words'})
          })

        // Divider().vertical(true).height(30).color($r('app.color.light_gray')).opacity(10).width(10).margin(10)
        Text('|')
          .textAlign(TextAlign.Center)
          .fontColor($r('app.color.light_gray'))
          .fontSize(60)
          .fontWeight(100)
          .alignRules({
            middle : {anchor: '__container__', align: HorizontalAlign.Center}
          })
          .offset({y:16})

      }
      .borderRadius(6)
      .backgroundColor(Color.White)
      .width('85%')
      .height(100)
      .margin({ bottom: 60 ,top:10})
      .shadow({ radius: 3, color: Color.Gray }) //学习天数


    }.width('100%')
    .height('35%')
    .backgroundColor(Color.White)
    .backgroundImage($r('app.media.mineBg'))
    .backgroundImageSize({ height: '75%', width: '100%' })//登录学习天数

      Column(){
      mine_bottom()
      }.backgroundColor(Color.White)
    }.backgroundColor($r('app.color.page_background'))
  }
}