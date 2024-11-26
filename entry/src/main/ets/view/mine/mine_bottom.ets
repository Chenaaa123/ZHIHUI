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

export {DividerTmp}

class Userone {
  name: string;
  image: ResourceStr;

  constructor(name: string, image: ResourceStr) {
    this.name = name;
    this.image = image;
  }
}

@Component
export default struct mine_bottom {
  private userones: Array<Userone> = [
    new Userone('学习记录', $r('app.media.record')),
    new Userone('我的发布', $r('app.media.annouce')),
    new Userone('我的积分', $r('app.media.intergral')),
    new Userone('我的下载', $r('app.media.download')),
    new Userone('账号信息', $r('app.media.account')),
    new Userone('客服反馈', $r('app.media.feedback')),
    new Userone('设置', $r('app.media.set')),
  ];

  @State egDivider: DividerTmp = new DividerTmp(1, 60, 10, '#ffe9f0f0')


  build() {
    Column() {
      List(){
      ForEach(
        this.userones,
        (userone:Userone) => {
          ListItem(){
            Row() {
              Image(userone.image)
                .width(30)
                .height(30)
                .margin({left:25})
              Text(userone.name)
                .layoutWeight(1)
                .offset({x:13})
                .fontSize(19)
                .textAlign(TextAlign.Start)
                .height(20)
              Image($r('app.media.right'))
                .size({width:15})
                .fillColor($r('app.color.light_gray'))
            }.width('93%')
            .height(60)
          }
        })
      }
      .divider(this.egDivider)

    }.width('100%')
    .height('100%')
  }
}
