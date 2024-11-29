import { CommonConstants } from '../../common/constants/CommonConstants'
import globalState from '../../model/CollectWordCountModel'
import mine_bottom from './mine_bottom';


@Component
export default  struct mine_top{
  @StorageLink("persistedMapString") persistedMapString: Map<number, string> = new Map<number, string>([])
  @Consume pageInfos: NavPathStack;
  build() {
    NavDestination(){
    Column() {
      RelativeContainer() {
        /*  用户登录     */
        //头像
        Column(){
          Image($r('app.media.user'))
            .height(60)
            .width(60)
            .margin({top:80})

          //用户名
          Text('未登录')
            .backgroundColor(Color.White)
            .width('80')
            .height(25)
            .fontSize(16)
            .margin({top:10})
            .textAlign(TextAlign.Center)
            .fontColor($r('app.color.light_gray'))
            .borderRadius(5) //设置圆角
        }
        .alignRules({
          middle: { anchor: '__container__', align: HorizontalAlign.Center },
          center: { anchor: '__container__', align: VerticalAlign.Top }
        })
      }
      .width('100%')
      .height(120)


      /*  center     */

      RelativeContainer() {
        Text('学习天数')
          .textAlign(TextAlign.Center)
          .fontSize(20)
          .alignRules({
            center : {anchor: '__container__', align: VerticalAlign.Center}
          })
          .offset({x:20,y:-15})
          .width('30%')

        Text('66')
          .fontSize(20)
          .textAlign(TextAlign.Center)
          .fontColor($r('app.color.gray'))
          .alignRules({
            center : {anchor: '__container__', align: VerticalAlign.Center}
          })
          .offset({x:20,y:20})
          .width('30%')


        Text('收藏词汇')
          .textAlign(TextAlign.Center)
          .fontSize(20)
          .alignRules({
            center : {anchor: '__container__', align: VerticalAlign.Center},
            end : {anchor: '__container__',align:HorizontalAlign.End}
          })
          .offset({x:-20,y:-15})
          .width('30%')

        Text(`${this.persistedMapString.size}`)
          .textAlign(TextAlign.Center)
          .fontSize(20)
          .fontColor($r('app.color.gray'))
          .alignRules({
            center : {anchor: '__container__', align: VerticalAlign.Center},
            end : {anchor: '__container__',align:HorizontalAlign.End}
          })
          .offset({x:-20,y:20})
          .width('30%')
          .onClick(() => {
            this.pageInfos.pushPath({ name:'Collect_words'})
          })

        // Divider().vertical(true).height(30).color($r('app.color.light_gray')).opacity(10).width(10).margin(10)
        Text('|')
          .textAlign(TextAlign.Center)
          .fontColor($r('app.color.light_gray'))
          .fontSize(60)
          .fontWeight(100)
          .alignRules({
            middle : {anchor: '__container__', align: HorizontalAlign.Center}
          })
          .offset({y:16})

      }
      .borderRadius(6)
      .backgroundColor(Color.White)
      .width('85%')
      .height(100)
      .margin({ bottom: 60 ,top:10})
      .shadow({ radius: 3, color: Color.Gray }) //学习天数


    }.width('100%')
    .height('35%')
    .backgroundImage($r('app.media.mineBg'))
    .backgroundImageSize({ height: '75%', width: '100%' })//登录学习天数
    }
  }
}