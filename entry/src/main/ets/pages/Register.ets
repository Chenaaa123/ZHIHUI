import router from '@ohos.router';
import { promptAction, window } from '@kit.ArkUI';

PersistentStorage.persistProp("account_password", new Map<number, string>([]));
@Entry
@Component
struct Register {
  @State text_again: string = ''
  /*controller: TextInputController = new TextInputController();*/
  @StorageLink("account_password") account_password: Map<number, string> = new Map<number, string>([]);
  @State account_user : number = 0
  @State password_user : string = ''
  @State password_again : string =''
  //设置全屏的方法
  onPageShow(): void {
    window.getLastWindow(AppStorage.get('context'), (err, data) => {
      if (err.code) {
        console.error('Failed to get last window.Cause:' + JSON.stringify(err));
        return;
      }
      data.setFullScreen(true);
    });
  }
  @State account_user_name: string = '';

  // @State password: string = '';
  @State confirmPassword: string = '';
  @State showConfirmPassword: boolean = false; // 新增状态，用于控制确认密码输入框的显示


  // 注册方法
  /*  async register() {
      if (this.username.trim() === '' || this.password.trim() === '') {
        alert('用户名或密码不能为空！');
        return;
      }
      // 保存用户信息到存储
      // 注册成功后跳转到登录页面
      router.replaceUrl({ url: 'pages/Login' });
    }*/

  onPasswordInputClick(): void { this.showConfirmPassword = true;}
  onHideConfirmPassword(): void { this.showConfirmPassword = false;}

  build() {
    Column({}) {
      Flex({
        direction: FlexDirection.Column,
        justifyContent: FlexAlign.Center,
        alignItems: ItemAlign.Center
      }) {
        Image($r("app.media.zhi_hui"))
          .width(250)
          .interpolation(ImageInterpolation.High)
      }
      .width('100%')
      .height(250)

      Column() {


        Stack(){
          TextInput({ placeholder: '请输入注册账号/邮箱', text: this.text_again,
           /* controller:this.controller*/})
            .width(250)
            .backgroundColor('#ffffffff')
            .type(InputType.Normal)
            .onChange((value) => {
              this.text_again = value
              this.account_user = parseInt(value)
              this.account_user_name = value
            })
            .zIndex(-1)
          if(this.text_again != ''){
            Image($r('app.media.input_delete'))
              .height('auto')
              .fillColor(Color.Gray)
              .onClick(() => {
                this.text_again = '';
              })
              .width('5%')
              .margin({left: 200})
          }
        }
        .width('100%')
        // Row() {
        //   TextInput({
        //     placeholder: '请输入注册账号/邮箱'
        //   })
        //     .width(250)
        //     .backgroundColor('#ffffffff')
        //     .type(InputType.Normal)
        //     .onChange((value) => {
        //       this.account_user = parseInt(value)
        //       this.account_user_name = value
        //     })
        // }
        // .justifyContent(FlexAlign.Center)
        // .width('100%')
        Row() {
          TextInput({
            placeholder: '请输入注册账号密码',
          })
            .width(250)
            .width(250)
            .backgroundColor('#ffffffff')
            .type(InputType.Password)
            .onClick(() => this.onPasswordInputClick())
            .onChange((Value) => {
              this.password_user = Value

            })
        }
        .width('100%')
        .margin({ top: 30 })
        .justifyContent(FlexAlign.Center)

        // 动态显示确认密码输入框
        if (this.showConfirmPassword) {
          Row() {
            TextInput({
              placeholder: '请确认账号密码',
            })
              .width(250)
              .backgroundColor('#ffffffff')
              .type(InputType.Password)
              .onChange((value) => {
                this.password_again = value
              })

          }
          .width('100%')
          .margin({ top: 30 })
          .justifyContent(FlexAlign.Center)
          .onMouse((event: MouseEvent) => {
            event.stopPropagation(); // 在Button的onMouse事件中设置阻止冒泡
          })
        }
        Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
          Button('注册', { type: ButtonType.Normal, stateEffect: true })
            .borderRadius(15)
            .backgroundColor(0x317aff)
            .width(100)
              //  this.password_user.trim() != '' && this.password_again.trim() != ''
            .onClick(() => {
              if ( this.password_user.trim() != '' && this.password_again.trim() != '') {
                if(this.password_user == this.password_again  ){
                  if(this.account_user_name.trim() !='') {
                    this.account_password.set(this.account_user,this.password_user)
                    promptAction.showToast({
                      message: '恭喜您注册成功',
                      duration: 5000, // 持续时间为5秒
                    })
                    router.replaceUrl({
                      url: 'pages/Login',
                    },
                      router.RouterMode.Single,
                      err => {
                        if(err){
                          console.log(`路由失败， errCode: ${err.code} errMsg: ${err.message}`);
                        }
                      }
                    )
                  }
                  else {
                    promptAction.showToast({
                      message: '账号不能为空',
                      textColor: Color.Red,
                      duration: 5000, // 持续时间为5秒
                    })
                  }
                }
                else {
                  promptAction.showToast({
                    message: '您两次输入的密码不一致,请重新输入!',
                    textColor: Color.Red,
                    duration: 5000, // 持续时间为5秒

                  })
                }

              }
              else{
                promptAction.showToast({
                  message: '您的密码不能为空',
                  textColor: Color.Red ,
                  duration: 5000, // 持续时间为5秒
                });
              }
            })
        }
        .width('100%')
        .margin({ top: 30 })

        Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
          Text("已有账号?")
            .fontSize(15)
          Button('点此登录').controlSize(ControlSize.SMALL).buttonStyle(ButtonStyleMode.TEXTUAL)
            .fontSize(15)
            .onClick(() => {
              //router跳转
              router.replaceUrl({
                url: 'pages/Login',
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
      }
      .height('100')
    }
    .onClick(() => this.onHideConfirmPassword())
    .backgroundColor('#ADD8E6')
    .height('100%')
    .width('100%')
  }
}

function alert(message: string) {
  console.error(message); // 这里可以替换为实际的弹出框实现
}