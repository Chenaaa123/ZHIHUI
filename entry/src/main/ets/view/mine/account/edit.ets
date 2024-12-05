import { promptAction } from "@kit.ArkUI";


@Component
export default struct edit {
  @State old_password: string = ''
  @State new_password: string = ''
  @State again_password: string = ''
  @StorageLink('current_password') current_password: string = ''
  @Consume pageInfos: NavPathStack

  @Builder
  NavigationMenus() {
    Row() {
      Button('完成')
        .fontSize(10)
        .backgroundColor($r('app.color.start_window_background'))
        .margin({ top: 13, right: 20 })
        .height(30)
        .onClick(() => {
          if (this.old_password === this.current_password) {
            if (this.new_password.trim() != '') {
              if (this.again_password.trim() != '') {
                if (this.new_password != this.old_password) {
                  if (this.new_password === this.again_password) {
                    this.current_password = this.new_password
                    this.pageInfos.pushPath({ name: 'account_management' })
                    promptAction.showToast({
                      message: '恭喜您修改成功！',
                      duration: 3000, // 持续时间为3秒
                    })
                  } else {
                    promptAction.showToast({
                      message: '新密码和确认密码不一致，请重新输入！',
                      duration: 3000, // 持续时间为3秒
                      textColor: Color.Red,
                    })
                  }
                } else {
                  promptAction.showToast({
                    message: '新密码和原密码一致，请重新输入！',
                    duration: 3000, // 持续时间为3秒
                    textColor: Color.Red,
                  })
                }
              } else {
                promptAction.showToast({
                  message: '确认密码不能为空，请重新输入！',
                  duration: 3000, // 持续时间为3秒
                  textColor: Color.Red,
                })
              }

            } else {
              promptAction.showToast({
                message: '新密码不能为空，请重新输入！',
                duration: 3000, // 持续时间为3秒
                textColor: Color.Red,
              })
            }
          } else {
            promptAction.showToast({
              message: '原密码输入错误，请重新输入！',
              duration: 3000, // 持续时间为3秒
              textColor: Color.Red,
            })
          }
        })
    }.width('20%').justifyContent(FlexAlign.End).zIndex(-1)
  }

  build() {
    NavDestination() {

      Column({ space: 7 }) {
        Row() {
          Text('原密码:')
          TextInput({ placeholder: '请输入原密码' })
            .type(InputType.Password)
            .width("83%")
            .backgroundColor(Color.White)
            .backgroundColor($r('app.color.welcome_color'))
            .margin({ left: 10 })
            .onChange((value) => {
              this.old_password = value
            })
        }
        .width("90%")
        .borderRadius(5)

        Row() {
          Text('新密码:')
          TextInput({ placeholder: '请输入新密码' })
            .type(InputType.Password)
            .width("83%")
            .margin({ left: 10 })
            .backgroundColor($r('app.color.welcome_color'))
            .onChange((value) => {
              this.new_password = value
            })
        }
        .width("90%")

        Row() {
          Text('请确认:')
          TextInput({ placeholder: '请确认新密码' })
            .type(InputType.Password)
            .width("83%")
            .margin({ left: 10 })
            .backgroundColor($r('app.color.welcome_color'))
            .onChange((value) => {
              this.again_password = value
            })
        }
        .width("90%")

      }
      .height("100%")
      .padding(10)
      .width("100%")
    }
    .title('修改密码')
    .menus(this.NavigationMenus())
  }
}