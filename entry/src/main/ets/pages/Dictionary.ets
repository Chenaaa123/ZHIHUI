import DividerTmp from '../model/DividerTmpModel';
import { ItemCategoryEnum } from '../model/ItemCategoryModel';
import ItemDictionaryModel from '../model/ItemDictionaryModel';

import DictionaryItem from '../viewmodel/DictionaryItem';
import { router } from '@kit.ArkUI';


@Component
export default struct Dictionary {
  // @Consume('pageInfos') pageInfos: NavPathStack
  @Consume pageInfos: NavPathStack
  @State egDivider: DividerTmp = new DividerTmp(1, 10, 10, '#ffe9f0f0')
  // @State iscategory : string =''

  // 标题
  @Builder
  titleBuilder() {
    Row() {
      Text('词典').fontWeight(500)
        .margin({top:18})
        .fontSize(20)
    }
  }

  @Builder TabContentBuilder(items:DictionaryItem[]){
    Column(){
    List({space:10}){
      ForEach(items,(item:DictionaryItem)=>{
        ListItem(){
          Column() {
            Row({ space: 6 }) {
              Image(item.image).width(50)
              Column({ space: 4 }) {
                Text('['+item.spell+']').fontWeight(500)
                Text(item.wordName)
              }
              Blank()
              // Text(item.detail)
              Image($r('app.media.right'))
                .size({ width: 15 })
                .fillColor($r('app.color.light_gray'))
            }
            .width('100%')
          }
        }
        .onClick(() => {
          let param = item
          this.pageInfos.pushPath({ name:'Word', param})
          })
      })
    }
    .width('100%')
    .height('100%')
    .divider(this.egDivider)
    .scrollBar(BarState.Auto)
    }
  }

  build() {
    NavDestination(){
      Column(){

        Tabs() {
          TabContent() {
            this.TabContentBuilder(ItemDictionaryModel.list())

          }
          .tabBar('全部')

          TabContent() {
            this.TabContentBuilder(ItemDictionaryModel.list(ItemCategoryEnum.Universal_sign_language))
          }
          .tabBar('通用手语')

          TabContent() {
            this.TabContentBuilder(ItemDictionaryModel.list(ItemCategoryEnum.Local_sign_language))
          }
          .tabBar('地方手语')
        }
        .width('100%')
        .height('100%')
    }
      .height('100%')
      .width('100%')
      .padding({left:15,right:15})
  }//.title('词典').backgroundColor($r('app.color.opacity_white_66'))
    .title(this.titleBuilder, {
      backgroundColor:$r('app.color.opacity_white_66')
    }) // 设置标题
  }
}

