import { router } from "@kit.ArkUI";


@Component
export default struct about_us{
  @Consume pageInfos: NavPathStack;
  build() {
  NavDestination(){
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
      Image($r('app.media.app_icon'))
        .width(100)
        .height(100)
        .margin({top:130})

      Text('指   麾')
        .fontSize(20)
        .margin({top:15})
        .backgroundColor($r('app.color.light_primary_color'))
        .width('25%')
        .textAlign(TextAlign.Center)
        .borderRadius(5)

      Text(){
        Span('      “指麾”').fontColor(Color.Blue).fontSize(16)
          .onClick(()=>{
            //router跳转
            router.pushUrl({
              url: 'pages/Index',
            })
          })
        Span('项目是由学生组织，联合各地残疾人联合会和特殊教育学校对全国各地区的自然手语统计整合，在宣传通用手语的同时，推动手语教育发展的公益性项目。致力于通过宣传通用手语和保护自然手语来实现服务听障人士、提高社会对听障人群关注度的最终目标。')
          .fontColor(Color.Black).fontSize(16)

      }
        .fontSize(15)
        .width('80%')
        .fontColor(Color.Grey)
        .margin({top:40})
        .backgroundColor($r('app.color.page_background'))
        .borderRadius(5)
      .padding(8)
    }.width('100%')
    .height('100%')

  }
  .title('关于我们')
  }
}