import mine_bottom from '../mine_bottom';
import { image } from '@kit.ImageKit';
import sigInDialog from './signInDialog';
PersistentStorage.persistProp("study_day_list", new Map<number, string>([]));
PersistentStorage.persistProp('user_name', "请输入用户名");


@Component
export default struct mine_top {
  @StorageLink("persistedMapString") persistedMapString: Map<number, string> = new Map<number, string>([])
  @Consume pageInfos: NavPathStack;
  @StorageLink('user_name') user_name: string = '用户'
  @StorageLink('study_days') study_days: number = 0;
  @State pixel: image.PixelMap | undefined = undefined;

  dialogController: CustomDialogController = new CustomDialogController({
    builder: sigInDialog({
      cancel: () => {
        this.onCancel()
      },
      confirm: () => {
        this.onAccept()
      },
    }),
  })

  onCancel() {
    console.info('Callback when the first button is clicked')
  }

  onAccept() {
    this.study_days += 1
    console.info('Callback when the second button is clicked')
  }


  build() {
    NavDestination() {
      Column() {
        RelativeContainer() {
          /*  用户登录     */
          //头像
          Column() {
            Image(this.pixel || $r('app.media.user'))
              .height(60)
              .width(60)
              .margin({ top: 80 })
              .borderRadius(50)
              .onClick(() => {
                this.pageInfos.pushPath({ name: 'account_info' })
              })

            //用户名
            Row() {
              TextInput({ placeholder: this.user_name })
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
              center: { anchor: '__container__', align: VerticalAlign.Center }
            })
            .offset({ x: 20, y: -15 })
            .width('30%')

          Text(String(this.study_days))
            .fontSize(20)
            .textAlign(TextAlign.Center)
            .fontColor($r('app.color.gray'))
            .alignRules({
              center: { anchor: '__container__', align: VerticalAlign.Center }
            })
            .offset({ x: 20, y: 20 })
            .width('30%')
            .onClick(() => {
              this.dialogController.open()
            })


          Text('收藏词汇')
            .textAlign(TextAlign.Center)
            .fontSize(20)
            .alignRules({
              center: { anchor: '__container__', align: VerticalAlign.Center },
              end: { anchor: '__container__', align: HorizontalAlign.End }
            })
            .offset({ x: -20, y: -15 })
            .width('30%')

          Text(`${this.persistedMapString.size}`)
            .textAlign(TextAlign.Center)
            .fontSize(20)
            .fontColor($r('app.color.gray'))
            .alignRules({
              center: { anchor: '__container__', align: VerticalAlign.Center },
              end: { anchor: '__container__', align: HorizontalAlign.End }
            })
            .offset({ x: -20, y: 20 })
            .width('30%')
            .onClick(() => {
              this.pageInfos.pushPath({ name: 'Collect_words' })
            })

          Text('|')
            .textAlign(TextAlign.Center)
            .fontColor($r('app.color.light_gray'))
            .fontSize(60)
            .fontWeight(100)
            .alignRules({
              middle: { anchor: '__container__', align: HorizontalAlign.Center }
            })
            .offset({ y: 16 })
        }
        .borderRadius(6)
        .backgroundColor(Color.White)
        .zIndex(2)
        .width('85%')
        .height(94)
        .margin({ bottom: 60, top: 10 })
        .shadow({ radius: 3, color: Color.Gray }) //学习天数
      }
      .width('100%')
      .height('35%')
      .backgroundColor(Color.White)
      .backgroundImage($r('app.media.mineBg'))
      .backgroundImageSize({ height: '75%', width: '100%' }) //登录学习天数
      Column() {
        mine_bottom()
      }.backgroundColor(Color.White)
    }.backgroundColor($r('app.color.page_background'))
  }
}