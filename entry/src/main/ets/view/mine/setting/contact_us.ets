@Builder
function Middle(email: string, phone: number) {
  Column() {
    Row() {
      Text('电子邮件：' + email)
        .fontColor(Color.Gray)
    }
    .width("100%")
    .padding({ left: 20 })

    Row() {
      Text('固定电话：' + phone)
        .fontColor(Color.Gray)
    }
    .padding({ left: 20 })
    .width("100%")
  }

}

class Title { //头部
  title_name: string
  email: string
  phone: number

  constructor(title_name: string, email: string, phone: number) {
    this.title_name = title_name
    this.email = email
    this.phone = phone
  }
}

@Component
export default struct contact_us {
  private contacts: Array<Title> = [
    new Title('广告投放合作：', 'ad@zhihui.com', 18322871614),
    new Title('市场推广、品牌合作：', 'branding@zhihui.com', 15879283851),
    new Title('技术类合作：', 'tech@zhihui.com', 15579485946),
    new Title('赞赏、业务咨询：', 'help@zhihui.com', 15179298601)
  ]

  build() {
    NavDestination() {
      Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Column() {
          Row() {
            Text('您可以通过以下方式联系我们')
              .fontSize(20)
              .fontWeight(FontWeight.Bolder)
              .textAlign(TextAlign.Start)
              .padding({ left: 20 })
          }
          .width("100%")
          .height(50)
          .margin({ top: 10 })

          List() {
            ForEach(this.contacts, (contact: Title) => {
              ListItem() {
                Column() {
                  Row({ space: 10 }) {
                    Text(contact.title_name)
                      .fontSize(18)
                      .fontWeight(FontWeight.Bolder)
                  }
                  .width('100%')
                  .height(20)
                  .justifyContent(FlexAlign.Start)
                  .margin({ top: 10, left: 40, bottom: 10 })

                  Middle(contact.email, contact.phone)
                }
                .backgroundColor($r('app.color.page_background'))
                .height(90)
                .borderRadius(5)
                .width('90%')
                .margin({ left: '5%', right: '5%' })

              }
              .margin({ bottom: 20 })

            })
          }
          .margin({ top: 30 })
        }
        .width("100%")
        .height("100%")
      }
    }
    .title('联系我们')
  }
}