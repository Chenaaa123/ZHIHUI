import DividerTmp from "../../model/DividerTmpModel";


class Mine_Menu {
  name: string;
  image: ResourceStr;
  menu_name: string;

  constructor(name: string, image: ResourceStr, menu_name: string) {
    this.name = name;
    this.image = image;
    this.menu_name = menu_name;
  }
}

@Component
export default struct mine_bottom {
  @State egDivider: DividerTmp = new DividerTmp(1, 60, 10, '#ffe9f0f0')
  @Consume pageInfos: NavPathStack;
  private Mine_Menus: Array<Mine_Menu> = [
  // new Mine_Menu('学习记录', $r('app.media.record'),'study_record'),
  // new Mine_Menu('我的发布', $r('app.media.annouce'),''),
  // new Mine_Menu('我的积分', $r('app.media.intergral'), ''),
  // new Mine_Menu('我的下载', $r('app.media.download'), ''),
    new Mine_Menu('账号信息', $r('app.media.account'), 'account_info'),
    // new Mine_Menu('客服反馈', $r('app.media.feedback'), ''),
    new Mine_Menu('设置', $r('app.media.set'), 'setting_info'),
  ];

  build() {
    Column() {
      NavDestination() {
        List() {
          ForEach(
            this.Mine_Menus,
            (mine_menu: Mine_Menu) => {
              ListItem() {
                Row() {
                  Image(mine_menu.image)
                    .width(30)
                    .height(30)
                    .margin({ left: 25 })
                  Text(mine_menu.name)
                    .layoutWeight(1)
                    .offset({ x: 13 })
                    .fontSize(19)
                    .textAlign(TextAlign.Start)
                    .height(20)
                  Image($r('app.media.right'))
                    .size({ width: 15 })
                    .fillColor($r('app.color.light_gray'))
                }.width('93%')
                .height(60)
              }
              .onClick(() => {
                this.pageInfos.pushPath({ name: mine_menu.menu_name })
              })
            })
        }
        .divider(this.egDivider)
      }

    }.width('100%')
    .height('100%')
  }
}
