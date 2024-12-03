import Blogger from "../../model/AttentionModel";
import AttentionItem from "../../viewmodel/AttentionItem";

@Component
export default struct home_bottom_attention{
  @State bloggerList :AttentionItem[] = []
  @Consume pageInfos: NavPathStack;
  aboutToAppear(){
    const blogger = new Blogger();
    this.bloggerList = blogger.getBlogger()
  }
  build() {
      Column(){
        List() {
          ForEach(this.bloggerList, (item: AttentionItem) => {
            //头部
            ListItem() {
              Row() {
                //头像
                Image(item.bloggerImage).width(50).height(50).margin({ right: 10 }).borderRadius('50%')
                Column() {
                  Text(item.bloggerName).fontSize(16)

                  Row() {
                    Text('粉丝数' + item.fans)
                      .fontSize(10)
                      .fontColor($r('app.color.gray'))
                      .backgroundColor($r('app.color.lightest_gray'))
                      .borderRadius(5)
                      .margin({ right: 5 })
                    Text(item.bloggerCategory)
                      .fontSize(10)
                      .fontColor($r('app.color.gray'))
                      .backgroundColor($r('app.color.lightest_gray'))
                      .borderRadius(5)
                  }.margin({top:5,bottom:5})

                  Text(item.signature)
                    .fontSize(12)
                    .maxLines(1)
                    .width(200)
                    .fontColor($r('app.color.gray'))
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                }.alignItems(HorizontalAlign.Start).height(50)

                Blank()
                Text('关 注')
                  .fontColor($r('app.color.likeIcon1'))
                  .borderColor($r('app.color.likeIcon1'))
                  .padding(5)
                  .borderWidth(1)
                  .borderRadius(12)
                  .fontSize(12)
              }.width('100%').margin({ bottom: 10 }).padding(10).backgroundColor(Color.White).borderRadius(10)
            }
          })
        }.scrollBar(BarState.Auto).width('100%')
      }.padding(10).borderRadius(15)
    }
  }
