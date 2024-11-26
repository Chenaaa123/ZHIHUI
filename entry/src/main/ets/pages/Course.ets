import { router } from '@kit.ArkUI';



@Component
export default struct Course {
  @Consume pageInfos: NavPathStack

  build() {
    NavDestination(){
      Column(){
        //1.头部导航
        this.Header()
        Text('AAAA')
        //2.列表
        // dictionaryList()

      }
      .height('100%')
      .width('100%')
    }
  }
  @Builder Header(){
    Navigation(){
      Image($r('app.media.class'))
        .width(24)
        .onClick(()=> router.back())
      Text('设置').fontSize(18).fontWeight(600).fontColor(Color.Black)
    }
    .width(940)
    .height(32)
  }
}