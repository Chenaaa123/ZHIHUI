import { router } from '@kit.ArkUI';



@Component
export default struct Course {
  wordData: string= '';
  @Consume pageInfos: NavPathStack
  // aboutToAppear(): void {
  //   let data = JSON.stringify(this.pageInfos.getParamByName('Word'));
  //   this.wordData = data
  // }
  build() {
    NavDestination(){
      Column(){

        Text('课程')


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