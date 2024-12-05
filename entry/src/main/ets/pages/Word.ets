
import DictionaryItem from '../viewmodel/DictionaryItem'
import { JSON } from '@kit.ArkTS'

import { window } from '@kit.ArkUI';
import { CommonConstants } from '../common/constants/CommonConstants';
import itemDictionaryModel from '../model/ItemDictionaryModel';
import ItemDictionaryModel from '../model/ItemDictionaryModel';
PersistentStorage.persistProp("persistedMapString", new Map<number, string>([]));
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

  // export class WordData {
  //   id?: number;
  //   wordName?: string;
  //   spell?: string;
  //   // image?: ImageData;
  //   image?: ResourceStr;
  //   categoryId?: number;
  //   detail?: string;
  //   action?: string;
  //   collected? : boolean;
  // }



@Component
export default struct Word {
  @State collectWordsList: Array<DictionaryItem> = []
  // @State collectWordsList: WordData[] = []
  // @State wordData: string = '';
  // @Prop item: DictionaryItem;
  @Consume pageInfos: NavPathStack;
  @State currentIndex: number = 0;
  @State wordDataList: Array<DictionaryItem> = []
  @State collectedWordColor : ResourceStr = $r('app.color.lightest_gray')
  @StorageLink("persistedMapString") persistedMapString: Map<number, string> = new Map<number, string>([]);


  // @State collect_word :string = ''
  // // 设置全屏的方法
  // onPageShow(): void {
  //   window.getLastWindow(AppStorage.get('context'), (err, data) => {
  //     if (err.code) {
  //       console.error('Failed to get last window.Cause:' + JSON.stringify(err))
  //       return
  //     }
  //     data.setFullScreen(true)
  //   })
  // }

  aboutToAppear(): void {
    let data = JSON.stringify(this.pageInfos.getParamByName('Word'));
    // this.wordData = data
    this.wordDataList = JSON.parse(data) as Array<DictionaryItem>
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

  // 标题
  @Builder
  titleBuilder() {
    Row() {
      Text('词汇详情').fontWeight(CommonConstants.FONT_WEIGHT_500)
        .margin({top:18})
        .fontSize(20)
    }
  }

  @Styles textStyle(){
    .margin({bottom:10,top:10})
  }
  build() {
    NavDestination() {
      ForEach(this.wordDataList,(item:DictionaryItem)=>{
          Column() {
            Column() {
              Row(){
                //词汇
                Text(item.wordName)
                  .fontSize(40)
                  .fontColor(Color.White)
                  .margin({ left: 18, top: 20 })
                Image($r('app.media.collect'))
                  .width(26).aspectRatio(1)
                  .margin({right:15,top:15})
                  .interpolation(ImageInterpolation.High)
                  .fillColor(!this.persistedMapString.has(item.id as number) ? $r('app.color.lightest_gray') : $r('app.color.collected_word')) // 根据全局状态变量设置图标颜色
                  .onClick(() => {
                    const collect_words = ItemDictionaryModel.findByWordName(item.wordName as string) || [];
                    const wordDataArray = collect_words as DictionaryItem[];  // 直接将 collect_words 断言为 WordData[] 类型
                    this.collectWordsList = this.collectWordsList.concat(wordDataArray);
                    for (let collectWordDataListElement of this.collectWordsList){
                      console.log("collectWordDataList Element " + collectWordDataListElement.wordName);
                      if(!this.persistedMapString.has(collectWordDataListElement.id as number))  this.persistedMapString.set(collectWordDataListElement.id as number,collectWordDataListElement.wordName as string)
                      else this.persistedMapString.delete(collectWordDataListElement.id as number)
                    }
                  })
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)

              //横线
              Divider()
                .color(Color.White)
                .strokeWidth(5)//粗细
                .width('90%')
                .margin({ left: 18, top: 10, bottom: 10 })
              //拼音
              Text('['+item.spell+']')
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
                          .fontWeight(CommonConstants.FONT_WEIGHT_500)
                          .textStyle()
                        Text(item.detail)
                          .fontSize(13)
                          .height('auto')
                          .fontColor($r('app.color.light_gray'))

                        Text('手语图示')
                          .fontSize(18)
                          .fontWeight(CommonConstants.FONT_WEIGHT_500)
                          .textStyle()

                        Image(item.image)
                          .width('70%')
                          .height(150)
                          .margin({left:'15%'})
                        Text('动作描述')
                          .fontSize(18)
                          .fontWeight(CommonConstants.FONT_WEIGHT_500)
                          .textStyle()
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
                    Video({
                      src: item.word_video
                    })
                      .muted(false) // 设置是否静音
                      .controls(false) // 设置是否显示默认控制条
                      .autoPlay(true) // 设置是否自动播放
                      .loop(true) // 设置是否循环播放
                      .borderRadius(10)
                      // .objectFit(ImageFit.Contain)
                  }.width('94%').height(220).offset({y:-200}).margin({right:10,left:10})
                }
                .tabBar(this.tabBuilder('视频', 1, $r('app.media.rectangle')))
              }
              .onChange(index => this.currentIndex = index)
            }.width('100%')
            .height('100%')
          }.backgroundColor($r('app.color.page_background'))
      })
    }.title(this.titleBuilder, {
      backgroundColor:$r('app.color.opacity_white_66')
      }) // 设置标题
      // .menus(this.NavigationMenus) // 顶部图标
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
