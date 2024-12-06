import { common } from '@kit.AbilityKit'
import { router } from '@kit.ArkUI'
import welcome_agree from './welcome_agree'

@Entry
@Component
struct Welcome {
  @StorageLink('welcome_approve') welcome_approve: number = 0
  context = getContext(this) as common.UIAbilityContext
  autoCancel: boolean = false;
  agree: CustomDialogController = new CustomDialogController({
    builder: welcome_agree({
      confirm: (): void => this.onConfirm(),
      cancel: (): void => this.exitApp()
    })
  })

  aboutToAppear(): void {
    //1.加载首选项
    //2.判断是否同意
    //2.1.同意，跳转首选项
    //2.2.不同意，弹窗
    if (this.welcome_approve == 0) {
      this.agree.open()
    } else {

      this.jumpToLogin()

    }
  }

  jumpToLogin() {
    setTimeout(() => {
      router.replaceUrl({
        url: 'pages/Login'
      })
    }, 1500)
  }

  onConfirm() {
    //1.保存首选项

    //2.跳转到首页
    this.jumpToLogin()
  }

  exitApp() {
    //退出App
    this.context.terminateSelf()
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.Logo'))
          .width(260)
          .interpolation(ImageInterpolation.High)

      }
      .layoutWeight(1)

      Image($r('app.media.Welcome'))
        .width(180)
        .height('auto')
        .interpolation(ImageInterpolation.High)
      Text('用手指点亮聆听，用爱心传递温暖')
        .fontSize(13)
        .opacity(0.8)
        .fontColor(Color.White)
        .padding({ left: 5, right: 5 })
        .margin({ bottom: 20 })
        .fontStyle(FontStyle.Italic)
    }.width('100%')
    .height('100%')
    .backgroundColor($r('app.color.light_primary_color'))
    .onClick(() =>{
      this.agree.open()
    })
  }
}