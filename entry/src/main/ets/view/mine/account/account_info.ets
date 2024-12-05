import DividerTmp from "../../../model/DividerTmpModel"
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { image } from '@kit.ImageKit';
import { fileIo as fs } from '@kit.CoreFileKit';

class Account {
  menuId: number
  name: string
  account_name: string
  jump_name: string

  constructor(menuId: number, name: string, account_name: string, jump_name: string) {
    this.menuId = menuId
    this.name = name
    this.account_name = account_name
    this.jump_name = jump_name
  }
}

@Component
export default struct account_info {
  @Consume pageInfos: NavPathStack;
  @StorageLink('signature') signature: string = '个签'
  @StorageLink('user_name') user_name: string = '用户'
  @State egDivider: DividerTmp = new DividerTmp(1, 10, 10, '#ffe9f0f0')
  private accounts: Array<Account> = [
    new Account(0, '用户名', '', 'user_name'),
    new Account(1, '个性签名', '', 'signature'),
    new Account(2, '账号管理', '', 'account_management')
  ]
  @State pixel: image.PixelMap | undefined = undefined;
  @State getAlbum: string = '显示相册中的图片';
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


  build() {
    NavDestination() {
      Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          Image(this.pixel || $r('app.media.user'))
            .height(70)
            .width(70)
            .margin({ top: 30 })
            .onClick(()=>{
              this.getPictureFromAlbum();
            })
            .borderRadius(50)
        List() {
          ForEach(
            this.accounts,
            (account: Account) => {
              ListItem() {
                Row() {
                  Text(account.name)
                    .width(100)
                    .height(40)
                    .margin({ left: 25 })
                  Blank()
                  if (account.menuId == 1) {
                    Text(this.signature)
                      .offset({ x: -10 })
                      .fontSize(15)//
                      .textAlign(TextAlign.Start)
                      .height(20)
                  } else if (account.menuId == 0) {
                    Text(this.user_name)
                      .offset({ x: -10 })
                      .fontSize(15)//
                      .textAlign(TextAlign.Start)
                      .height(20)
                  }
                  Text(account.account_name)
                    .offset({ x: -10 })
                    .fontSize(15)//
                    .textAlign(TextAlign.Start)
                    .height(20)

                  Image($r('app.media.right'))
                    .size({ width: 15 })
                }.width('93%')
                .height(40)
                .margin({ top: 10 })
                .onClick(() => {
                  this.pageInfos.pushPath({ name: account.jump_name })
                })
              }
            })
        }
        .divider(this.egDivider)
        .margin({ top: 20 })

      }
      .width('100%') // 设置Flex的宽度为100%，以填充Column
      .height('100%')

    }
    .title('账号信息')
  }
}