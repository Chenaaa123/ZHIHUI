//学习卡片

@Component
export struct studyCard{

  build() {
    Column(){
      //日期信息
      Row(){
        Text('2024/01/01')
          .fontColor(Color.Blue)
        Image($r('app.media.background'))
          .width(20)
          .fillColor($r('app.color.primary_color'))
      }
      .padding(12)
    }
    .width('90%')
    .backgroundColor(Color.Green)
    .borderRadius(18)
  }
}