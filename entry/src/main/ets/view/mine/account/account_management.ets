// import { promptAction } from "@kit.ArkUI"
//
import { promptAction } from "@kit.ArkUI"


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
  @State look : boolean = true
  @Consume pageInfos: NavPathStack;
  @StorageLink('current_name') current_name: number = 0
  @StorageLink('current_password') current_password: string = ''
  // @StorageLink("persistedMapString") persistedMapString: Map<number, string> = new Map<number, string>([]);

  private accounts :Array<Account_ma>=[
    new Account_ma(0,'账号',''),
    new Account_ma(2,'修改密码','edit'),
    new Account_ma(1,'查看密码',''),
    new Account_ma(3,'更多账号设置','')
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
                  }
                  else if(account.menuId == 1){
                    // Text(`${this.current_password}`)
                    //   .offset({ x: -10 })
                    //   .fontSize(15)//        .fontCol
                    //   .privacySensitive(true)
                    //   .obscured([ObscuredReasons.PLACEHOLDER])
                    //   .textAlign(TextAlign.Start)
                    //   .height(20)
                    Image($r('app.media.right'))
                      .size({ width: 15 })
                  }else if (account.menuId == 2) {
                    Text(this.look? '******':  `${this.current_password}`)
                      .offset({ x: -10 })
                      .fontSize(15)
                      // .obscured([ObscuredReasons.PLACEHOLDER])
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
                  if(account.menuId == 1){
                    this.look = false
                    setTimeout(() => {
                     this.look = true
                    }, 3000)
                  }
                  if(account.menuId == 2){
                    this.pageInfos.pushPath({ name:account.account_set})
                  }
                  if(account.menuId == 3){
                    promptAction.showToast({
                      message: '该功能正在调试，敬请期待~',
                      duration: 3000, // 持续时间为3秒
                    })
                  }


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