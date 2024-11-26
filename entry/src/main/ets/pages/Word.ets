
import DictionaryItem from '../viewmodel/DictionaryItem'
import { JSON } from '@kit.ArkTS'

// export function WordBuilder(name: string, param: Object) {
//   Word()
// }

// 定义 JSON 数据类型
// export class ImageData {
//   id?: number;
//   type?: number;
//   params?:string[];       // 假设 params 的类型是字符串数组
//   bundleName?: string;
//   moduleName?:string;}

  export class WordData {
    id?: number;
    wordName?: string;
    spell?: string;
    // image?: ImageData;
    image?: ResourceStr;
    categoryId?: number;
    detail?: string;
    action?: string;
  }

@Component
export default struct Word {

  // @State wordData: string = '';
  @Prop item: DictionaryItem;
  @Consume pageInfos: NavPathStack;
  @State currentIndex: number = 0;
  @State wordDataList: Array<WordData> = []


  aboutToAppear(): void {
    let data = JSON.stringify(this.pageInfos.getParamByName('Word'));
    // this.wordData = data
    this.wordDataList = JSON.parse(data) as Array<WordData>
    for (let wordDataListElement of this.wordDataList){
      console.log("wordDataList Element " + wordDataListElement.wordName);
    }
  }

  @Builder tabBuilder(title: string, targetIndex: number, selectedImg: Resource) {
    Stack() {
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#ff010c11' : '#6B6B6B')
        .fontWeight(this.currentIndex === targetIndex ? 470 : 450)
        .fontSize(20)
      if (this.currentIndex === targetIndex) {
        Image(selectedImg)
          .size({ width: 40, height: 20 })
          .fillColor($r('app.color.primary_color'))
          .zIndex(-1)
          .margin({ top: 15 })

      } else {
        Image(selectedImg)
          .size({ width: 0, height: 0 })
      }
    }
    .width('100%')
    .height(50)
  }

  @Styles textstyle(){
    .margin({bottom:10,top:10})
  }
  build() {
    NavDestination() {
      ForEach(this.wordDataList,(item:WordData)=>{
          Column() {

            Column() {
              //词汇
              Text(item.wordName)
                .fontSize(40)
                .fontColor(Color.White)
                .margin({ left: 18, top: 20 })
              //横线
              Divider()
                .color(Color.White)
                .strokeWidth(5)//粗细
                .width('90%')
                .margin({ left: 18, top: 10, bottom: 10 })
              //拼音
              Text(item.spell)
                .fontSize(20)
                .fontColor(Color.White)
                .margin({ left: 18, bottom: 30 })

            }
            .backgroundImage($r('app.media.BIGword'))
            .backgroundImageSize(ImageSize.Cover)
            .height(140)
            .width('100%')
            .alignItems(HorizontalAlign.Start)

            //图示和视频
            Column() {
              Tabs() {
                TabContent() {
            //图示
                    RelativeContainer(){
                      Column() {
                        Text('基础释义')
                          .fontSize(18)
                          .fontWeight(500)
                          .textstyle()
                        Text(item.detail)
                          .fontSize(13)
                          .height('auto')
                          .fontColor($r('app.color.light_gray'))

                        Text('手语图示')
                          .fontSize(18)
                          .fontWeight(500)
                          .textstyle()
                        // Image($r('app.media.gaoxing'))
                        Image(item.image)
                          .width('70%')
                          .height(150)
                          .margin({left:'15%'})
                        Text('动作描述')
                          .fontSize(18)
                          .fontWeight(500)
                          .textstyle()
                        Text(item.action)
                          .fontSize(13)
                          .height('auto')
                          .fontColor($r('app.color.light_gray'))

                      }
                      .alignItems(HorizontalAlign.Start)
                      .width('90%')
                      .height('auto')
                      .margin({left:'5%'})
                      .backgroundColor(Color.White)
                      .borderRadius(10)
                      .padding({left:10,bottom:10,right:10})
                    }.width('100%')

                  }

                .tabBar(this.tabBuilder('图示', 0, $r('app.media.rectangle')))
              //视频
                TabContent() {
                  Column() {
                    Text('a')
                  }
                }
                .tabBar(this.tabBuilder('视频', 1, $r('app.media.rectangle')))
              }
              .onChange(index => this.currentIndex = index)
            }.width('100%')
            .height('100%')
          }.backgroundColor($r('app.color.page_background'))
      })
    } //.title('词汇详情页')
    .onBackPressed(() => {
      this.pageInfos.pop()
      return true
    })
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
      console.log("current page config info is " + JSON.stringify(context.getConfigInRouteMap()))
    })
  }
}
