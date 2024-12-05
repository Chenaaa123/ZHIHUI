import router from '@ohos.router';
import { promptAction, window } from '@kit.ArkUI'
import { url } from '@kit.ArkTS';
import { text } from '@kit.ArkGraphics2D';

class RouterInfo {
  //页面路径
  url: string
  //页面标题
  title: string

  constructor(url: string, title: string) {
    this.url = url;
    this.title = title
  }
}

// // 验证账号密码的函数
// function verifyAccountPassword(accountId: number, password: string, ): boolean {
//   // 检查账号是否存在并且密码匹配
//   if (account_password.has(accountId)) {
//     const storedPassword = account_password.get(accountId);
//     return storedPassword === password;
//   }
//   // 如果账号不存在，返回false
//   return false;
// }


@Entry
@Component
struct Login {

  @State text: string = '';
  /*controller: TextInputController = new TextInputController();*/

  @State imageWidth: number = 30
  private routers: RouterInfo[] = [
    new RouterInfo('pages/Register', '注册页面')
  ]
  @StorageLink("account_password") account_password: Map<number, string> = new Map<number, string>([]);
  @State account_user : number = NaN
  @State password_user : string = ''
  @State storedPassword : string = ''
  @StorageLink('current_name') current_name: number = 0
  @StorageLink('current_password') current_password: string = ''

  build() {
    Column({}) {
      // 第一行：文本和图片
      Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Image($r("app.media.zhi_hui"))
          .width(250)
          .interpolation(ImageInterpolation.High)
      }
      .width('100%') // 设置Flex的宽度为100%，以填充Column
      .height(250)
      .width('100%')

      // 第二行：第一个文本输入框
      Column() {
        // Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center })
        Stack(){
          TextInput({ placeholder: '请输入登录账号/邮箱', text: this.text,
           /* controller:this.controller*/})
            .width(250)
            .backgroundColor('#ffffffff')
            .type(InputType.Normal)
            .onChange((Value) => {
              this.text = Value
              this.account_user = parseInt(Value)
              this.storedPassword = this.account_password.get(this.account_user) as string
            })
            .zIndex(-1)
          if(this.text != ''){
            Image($r('app.media.input_delete'))
              .height('auto')
              .fillColor(Color.Gray)
              .onClick(() => {
                this.text = '';
              })

              .width('5%')
              .margin({left: 200})
          }
        }.width('100%')
        // 第三行：第二个文本输入框
        Row() {
          TextInput({ placeholder: '请输入账号/邮箱密码'})
            .width(250)
            .width(250)
            .backgroundColor('#ffffffff')
            .type(InputType.Password)
            .onChange((Value) => {
              this.password_user = Value
            })
        }
        .width('100%')
        .margin({ top: 30 })
        .justifyContent(FlexAlign.Center)

        // 登录按钮
        Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
          Button('登录', { type: ButtonType.Normal, stateEffect: true })
            .borderRadius(15)
            .backgroundColor(0x317aff)
            .width(100)
            .onClick(() => {
              if(this.account_user == null || this.storedPassword == null){
                promptAction.showToast({
                  message: '您输入的账号或密码不存在！',
                  duration: 3000, // 持续时间为3秒
                  textColor: Color.Red
                })
              }
              if (this.account_password.has(this.account_user)) {
                if( this.password_user === this.storedPassword ) {
                  this.current_name = this.account_user
                  this.current_password = this.password_user
                  promptAction.showToast({
                    message: '恭喜您登录成功~',
                    duration: 3000, // 持续时间为3秒
                  })
                  //router跳转
                  router.replaceUrl({
                    url: 'pages/Index',
                  },
                    router.RouterMode.Single,
                    err => {
                      if(err){
                        console.log(`路由失败， errCode: ${err.code} errMsg: ${err.message}`);
                      }
                    }
                  )
                }
                else{
                  promptAction.showToast({
                    message: '您输入的账号或密码有误，请重新输入！',
                    duration: 3000, // 持续时间为3秒
                    textColor: Color.Red
                  })
                }
              }
              //router跳转
              // if(this.account_password[0].has(this.account_user as number ,this.password_user as string))
              //   console.log('登录成功');
              // else  console.log('登录失败');
              // this.account_password.set(this.account_user,this.password_user)
              // router.pushUrl({
              //   url: 'pages/Index',
              // },
              //   router.RouterMode.Single,
              //   err => {
              //     if(err){
              //       console.log(`路由失败， errCode: ${err.code} errMsg: ${err.message}`);
              //     }
              //   }
              // )
            })
        }
        .width('100%')
        .margin({ top: 30 })

        // 原有的注册按钮
        Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

          Text("没有账号?")
            .fontSize(15)
          Button('点此注册').controlSize(ControlSize.SMALL).buttonStyle(ButtonStyleMode.TEXTUAL)
            .fontSize(15)
            .onClick(() => {

              //router跳转
              router.replaceUrl({
                url: 'pages/Register',
              },
                router.RouterMode.Single,
                err => {
                  if(err){
                    console.log(`路由失败， errCode: ${err.code} errMsg: ${err.message}`);
                  }
                }
              )
            })
        }
        .width(250)
        .margin({ top: 20 })

        Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Image($r("app.media.Logo"))
            .width(250)
            .interpolation(ImageInterpolation.High)
        }
        .width('100%') // 设置Flex的宽度为100%，以填充Column
        .height(250)
        .width('100%')
      }
      .height('100')
    }
    .backgroundColor('#ADD8E6')
    .height('100%')
    .width('100%')

  }
}
