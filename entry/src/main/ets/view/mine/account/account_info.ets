import { router } from '@kit.ArkUI'

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



class Account {
  menuId :number
  name : string
  account_name : string
  jump_name : string

  constructor(menuId :number,name : string, account_name : string, jump_name: string) {
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

  // @StorageLink("persistedMapString") persistedMapString: Map<number, string> = new Map<number, string>([]);

  private accounts :Array<Account>=[
    new Account(0,'用户名','','user_name'),
    new Account(1,'个性签名','','signature'),
    new Account(2,'账号管理','','account_management')
  ]
  @State egDivider: DividerTmp = new DividerTmp(1, 10, 10, '#ffe9f0f0')


  build() {
    NavDestination() {
      Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
        Image($r('app.media.user'))
          .height(70)
          .margin({ top: 30 })
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
                      .fontSize(15)//        .fontColor(Color.Gray)
                      .textAlign(TextAlign.Start)
                      .height(20)
                  } else if (account.menuId == 0) {
                    Text(this.user_name)
                      .offset({ x: -10 })
                      .fontSize(15)//        .fontColor(Color.Gray)
                      .textAlign(TextAlign.Start)
                      .height(20)
                  }
                  Text(account.account_name)
                    .offset({ x: -10 })
                    .fontSize(15)//        .fontColor(Color.Gray)
                    .textAlign(TextAlign.Start)
                    .height(20)

                  Image($r('app.media.right'))
                    .size({ width: 15 })
                  //  .fillColor($r('app.color.light_gray'))
                }.width('93%')
                .height(40)
                .margin({ top: 10 })
                .onClick(() => {
                  this.pageInfos.pushPath({ name:account.jump_name})
                })
              }
              /*     .onClick(() => {
                     this.pageInfos.pushPath({ name:mine_menu.menu_name})
                   })*/
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