
class DividerTmp {
  strokeWidth: Length = 1
  startMargin: Length = 10
  endMargin: Length = 20
  color: ResourceColor = '#ffe9f0f0'

  constructor(strokeWidth: Length, startMargin: Length, endMargin: Length, color: ResourceColor) {
    this.strokeWidth = strokeWidth
    this.startMargin = startMargin
    this.endMargin = endMargin
    this.color = color
  }
}

class Account_ma {
  menuId :number
  name : string
  account_set: string

  constructor(menuId :number,name : string, account_set: string) {
    this.menuId = menuId
    this.name = name
    this.account_set = account_set
  }
}

@Component
export default struct account_management {
  @Consume pageInfos: NavPathStack;
  @StorageLink('current_name') current_name: number = 0
  @StorageLink('current_password') current_password: string = ''
  // @StorageLink("persistedMapString") persistedMapString: Map<number, string> = new Map<number, string>([]);

  private accounts :Array<Account_ma>=[
    new Account_ma(0,'账号',''),
    new Account_ma(1,'账号密码',''),
    new Account_ma(2,'更多账号设置','')
  ]
  @State egDivider: DividerTmp = new DividerTmp(1, 10, 10, '#ffe9f0f0')


  build() {
    NavDestination() {
      Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
        List() {
          ForEach(
            this.accounts,
            (account: Account_ma) => {
              ListItem() {
                Row() {
                  Text(account.name)
                    .width(100)
                    .height(40)
                    .margin({ left: 25 })
                  Blank()
                  if (account.menuId == 0) {
                    Text(`${this.current_name}`)
                      .offset({ x: -10 })
                      .fontSize(15)//        .fontColor(Color.Gray)
                      .textAlign(TextAlign.Start)
                      .height(20)
                  } else if (account.menuId == 1) {
                    Text(`${this.current_password}`)
                      .offset({ x: -10 })
                      .fontSize(15)//        .fontColor(Color.Gray)
                      .textAlign(TextAlign.Start)
                      .height(20)
                    Image($r('app.media.right'))
                      .size({ width: 15 })
                  }
                  else {
                    Image($r('app.media.right'))
                    .size({ width: 15 })
                  }

                  //  .fillColor($r('app.color.light_gray'))
                }.width('93%')
                .height(40)
                .margin({ top: 10 })
                .onClick(() => {
                  this.pageInfos.pushPath({ name:account.account_set})
                })
              }
            })
        }
        .divider(this.egDivider)

      }
      .width('100%') // 设置Flex的宽度为100%，以填充Column
      .height('100%')

    }
    .title('账号管理')
  }
}