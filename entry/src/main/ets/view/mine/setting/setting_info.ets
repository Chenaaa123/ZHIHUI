import { promptAction, router } from "@kit.ArkUI"

@Component
export default struct setting_info {
  @Consume pageInfos: NavPathStack;

  @Builder
  SettingMenu(title: string, imageIcon: ResourceStr) {
    Column() {
      Row() {
        Image(imageIcon)
          .width(20).height(20)
          .margin({ left: 10, right: 15 })
          .fillColor($r('app.color.gray'))
        Text(title)
          .width(100)
          .height(24)

        Blank()
        Image($r('app.media.right'))
          .size({ width: 15 })
          .margin({ right: 10 })
      }
      .width('90%')
      .height(40)
      .margin({ top: 10 })
      .backgroundColor($r('app.color.page_background'))
      .borderRadius(10)

    }
  }

  build() {
    NavDestination() {
      Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
        Row() {
          this.SettingMenu('关于我们', $r('app.media.about_us'))
        }
        .onClick(() => {
          this.pageInfos.pushPath({ name: 'about_us' })
        })

        Row() {
          this.SettingMenu('联系我们', $r('app.media.contact_us'))
        }
        .onClick(() => {
          this.pageInfos.pushPath({ name: 'contact_us' })
        })

        Row() {
          Image($r('app.media.version_details'))
            .width(20).height(20)
            .margin({ left: 10, right: 15 })
            .fillColor($r('app.color.gray'))
          Text('检查版本更新')
            .width(100)
            .height(24)
          Blank()
          Text('v0.1')
            .fontSize(14)
            .fontColor($r('app.color.gray'))
            .margin({ right: 10 })
        }
        .width('90%')
        .height(40)
        .borderRadius(10)
        .margin({ top: 10 })
        .onClick(() => {
          promptAction.showToast({
            message: '当前已经是最新版本了哟~',
            duration: 5000, // 持续时间为5秒
          });
        })
        .backgroundColor($r('app.color.page_background'))

        Button('退出登录')
          .width('90%')
          .height(50)
          .margin({ top: 480 })
          .borderRadius(5)
          .onClick(() => {
            router.replaceUrl({
              url: 'pages/Login',
            },
              router.RouterMode.Single,
              err => {
                if (err) {
                  console.log(`路由失败， errCode: ${err.code} errMsg: ${err.message}`);
                }
              })
          })
      }
      .width('100%') // 设置Flex的宽度为100%，以填充Column
      .height('100%')
      .backgroundColor(Color.White)
    }
    .title('设置')
    .backgroundColor($r('app.color.page_background'))
  }
}