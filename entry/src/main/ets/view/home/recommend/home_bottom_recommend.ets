import DividerTmp from "../../../model/DividerTmpModel";
import NewsManager from "../../../model/RecommendNewsModel"
import newsItem from "../../../viewmodel/Recommend_news"


@Component
export default struct home_bottom_recommend {
  @State egDivider: DividerTmp = new DividerTmp(1, 10, 10, '#ffe9f0f0') //分割线
  @State newsList: newsItem[] = []
  @Consume pageInfos: NavPathStack;

  aboutToAppear() {
    const newsManager = new NewsManager();
    this.newsList = newsManager.getNews()
  }

  build() {
    Column() {
      List() {
        ForEach(this.newsList, (item: newsItem) => {
          ListItem() {
            Row() {
              Text(item.content)
                .width('75%')
                .height(40)
                .maxLines(2)
                .fontSize(14)
                .margin({ bottom: 10 })
                .fontColor(Color.Black)
                .maxFontSize(15)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
              Blank()
              Image(item.new_image)
                .width(55)
                .height(50)
                .margin({ right: 20 })
                .borderRadius(5)
            }
            .width('100%')
            .height(80)
            .margin({ top: 1, left: 10 })
          }.onClick(() => {
            let param = item
            this.pageInfos.pushPath({ name: 'recommendNews', param })
          })
        })
      }
      .backgroundColor(Color.White)
      .borderRadius(10)
      .width('94%')
      .divider(this.egDivider)
      .scrollBar(BarState.Auto)
      .height('auto')

    }.width('100%')
    .height('100%')
  }
}
