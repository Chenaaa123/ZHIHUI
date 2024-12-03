import { CommonConstants } from "../../../common/constants/CommonConstants";
import newsItem from "../../../viewmodel/Recommend_news";
import shareDialog from "./shareDialog";

@Extend(Text) function fontsize_color(fontSize:number) {
  .fontSize(fontSize)
  .fontColor($r('app.color.light_gray'))
}


@Component
export default struct recommendNews{
  @State fontSizeValue: number = 14
  @Consume pageInfos: NavPathStack;
  @State NewList: Array<newsItem> = []
  aboutToAppear(): void {
    let data = JSON.stringify(this.pageInfos.getParamByName('recommendNews'));
    this.NewList = JSON.parse(data) as Array<newsItem>
  }

  //自定义弹窗  分享
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: shareDialog(),
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: 30 },
    gridCount: 4,
    customStyle: false,
    // backgroundColor: 0xd9ffffff,   //边框颜色
    cornerRadius: 20,  //圆角
    width: '100%',
    height: '800px',
    borderWidth: 1,
    borderStyle: BorderStyle.Dashed,//使用borderStyle属性，需要和borderWidth属性一起使用
    borderColor: Color.White,//使用borderColor属性，需要和borderWidth属性一起使用
    // shadow: ({ radius: 20, color: Color.Grey, offsetX: 50, offsetY: 0}),  //阴影
  })

  // 在自定义组件即将析构销毁时将dialogController置空
  aboutToDisappear() {
    this.dialogController = null // 将dialogController置空
  }


  build() {
    NavDestination(){
    Column(){
      ForEach(this.NewList,(item:newsItem)=>{
      //头部
      Row(){
        //头像
        Image($r('app.media.app_icon')).width(45).height(45).margin({right:5})
        Column(){
          Text('指麾').margin({bottom:8,top:5})
          Row(){
            Text('官方信息').fontColor($r('app.color.primaryEst_color')).margin({right:5}).fontSize(14)
            Text(item.new_date).fontsize_color(this.fontSizeValue)
          }
        }.alignItems(HorizontalAlign.Start).height(50)
        Blank()
        Image($r('app.media.three_point')).width(10).height(20)
          .onClick(() => {
            if (this.dialogController != null) {
              this.dialogController.open()
            }
          })
      }.width('100%').height(50).margin({bottom:10})

      //content内容
        //标题
      Text(item.newTitle).fontWeight(CommonConstants.FONT_WEIGHT_500)
        //内容
      Text(item.content).margin({top:10,bottom:10}).width('100%').height('auto').fontSize(14)
        //图片
      Image(item.new_image).width('100%').height('auto').borderRadius(5)

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
        Text('点赞十万').fontColor($r('app.color.likeIcon1')).backgroundColor($r('app.color.likeIcon1Bg')).padding(2).margin({right:10}).borderRadius(5)
        Text('最新发布').fontColor($r('app.color.likeIcon2')).backgroundColor($r('app.color.likeIcon2Bg')).padding(2).borderRadius(5)
        Blank()
        Image($r('app.media.comment')).width(18).height(18)
        Text('888').fontsize_color(this.fontSizeValue).margin({left:5,right:5})
        Image($r('app.media.like')).width(18).height(18).margin({left:5,right:5})
        Text('12万').fontsize_color(this.fontSizeValue)
      }.width('100%')
      })
    }.alignItems(HorizontalAlign.Start).margin({right:15,left:15})
    }.title('推荐新闻')
  }
}