
import { ItemCategoryEnum } from '../model/ItemCategoryModel';
import ItemDictionaryModel from '../model/ItemDictionaryModel';
import { DividerTmp } from '../view/mine/mine_bottom';
import DictionaryItem from '../viewmodel/DictionaryItem';


@Component
export default struct Dictionary {
  // @Consume('pageInfos') pageInfos: NavPathStack
  @Consume pageInfos: NavPathStack
  @State egDivider: DividerTmp = new DividerTmp(1, 10, 10, '#ffe9f0f0')
  @State iscategory : string =''

  @Builder TabContentBuilder(items:DictionaryItem[]){
    List({space:10}){
      ForEach(items,(item:DictionaryItem)=>{
        ListItem(){
          Column() {
            Row({ space: 6 }) {
              Image(item.image).width(50)
              Column({ space: 4 }) {
                Text(item.spell).fontWeight(500)
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
  }.title('词典').backgroundColor($r('app.color.opacity_white_66'))
  }
}

