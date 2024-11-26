class title {
  text : string
  image : ResourceStr

  constructor(text:string,image: ResourceStr) {
    this.text = text
    this.image = image

  }
}

class DividerTmp {
  strokeWidth: Length = 1
  startMargin: Length = 60
  endMargin: Length = 10
  color: ResourceColor = '#ffe9f0f0'

  constructor(strokeWidth: Length, startMargin: Length, endMargin: Length, color: ResourceColor) {
    this.strokeWidth = strokeWidth
    this.startMargin = startMargin
    this.endMargin = endMargin
    this.color = color
  }
}

@Component
export default struct home_bottom_componentOne{
  @State egDivider: DividerTmp = new DividerTmp(1, 60, 10, '#ffe9f0f0')

  private titles: Array<title> =[
    new title('关爱沟通无障碍，聆听心灵的声音|指麾团队走访景德镇特殊教育学校',($r('app.media.onepage_list1'))),
    new title('关爱沟通无障碍，聆听心灵的声音|指麾团队走访景德镇特殊教育学校',($r('app.media.onepage_list2'))),
    new title('关爱沟通无障碍，聆听心灵的声音|指麾团队走访景德镇特殊教育学校',($r('app.media.onepage_list3'))),
    new title('关爱沟通无障碍，聆听心灵的声音|指麾团队走访景德镇特殊教育学校',($r('app.media.history'))),
    new title('关爱沟通无障碍，聆听心灵的声音|指麾团队走访景德镇特殊教育学校',($r('app.media.history'))),
  ]

  build() {
      Column() {
        List() {
          ForEach(
            this.titles,
            (item: title) => {
              ListItem() {
                Row() {
                  Text(item.text)
                    .width('75%')
                    .height(40)
                    .fontSize(14)
                    .margin({bottom:10})
                    .fontColor(Color.Black)
                  Blank()
                  Image(item.image)
                    .width(55)
                    .height(50)
                    .margin({right:20})
                    .borderRadius(5)
                }
                .width('100%')
                .height(80)
                .margin({top:1,left:10})

              }
            })
        }.backgroundColor(Color.White)
        .borderRadius(10)
        .width('94%')
        .divider(this.egDivider)
        .scrollBar(BarState.Auto)
        .height('auto')

      }.width('100%')
      .height('100%')
    }
  }
