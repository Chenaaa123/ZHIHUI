@Extend(Text) function fontsize_color(fontSize:number) {
  .fontSize(fontSize)
  .fontColor($r('app.color.light_gray'))
}

@Entry
@Component
export default struct TextPage{
  @State fontSizeValue: number = 14

  build() {
    Column(){
      //头部
      Row(){
        Image($r('app.media.app_icon')).width(45).height(45).margin({right:5})
        Column(){
          Text('指麾').margin({bottom:8,top:5})
          Row(){
            Text('官方信息').fontColor($r('app.color.primaryEst_color')).margin({right:5}).fontSize(14)
            Text('12-25').fontsize_color(this.fontSizeValue)
          }
        }.alignItems(HorizontalAlign.Start).height(50)
        Blank()
        Image($r('app.media.three_point')).width(10).height(20)
      }.width('100%').height(50).margin({bottom:10})

      //content内容
      Text('标题')
      Text('AAAAAAAAAAAAAAAAAAAAAAAAAAAA').margin({top:10,bottom:10}).width('100%').height('auto')
      Image($r('app.media.course_slideshow2')).width('auto').height(200).borderRadius(5)

      //评论会话
      Row(){
        Image($r('app.media.information')).width(20).height(20).fillColor($r('app.color.light_gray')).margin({right:5})
        Text('指麾').fontsize_color(this.fontSizeValue)
        Blank()
        Text('10万人正在聊').fontsize_color(this.fontSizeValue)
        Image($r('app.media.right')).width(20).height(10).fillColor($r('app.color.light_gray'))
      }.backgroundColor($r('app.color.lightest_gray')).width('100%').height(40).borderRadius(5).padding(5).margin({top:10,bottom:10})
      //标签与点赞
      Row(){
        Text('点赞十万').fontColor($r('app.color.likeIcon1')).backgroundColor($r('app.color.likeIcon1Bg')).padding(2).margin({right:10})
        Text('最新发布').fontColor($r('app.color.likeIcon2')).backgroundColor($r('app.color.likeIcon2Bg')).padding(2)
        Blank()
        Image($r('app.media.comment')).width(18).height(18)
        Text('888').fontsize_color(this.fontSizeValue).margin({left:5,right:5})
        Image($r('app.media.like')).width(18).height(18).margin({left:5,right:5})
        Text('12万').fontsize_color(this.fontSizeValue)
      }.width('100%')
    }.alignItems(HorizontalAlign.Start).margin({right:15,left:15})
  }
}