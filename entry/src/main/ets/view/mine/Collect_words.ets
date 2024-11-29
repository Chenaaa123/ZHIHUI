import { DividerTmp } from "./mine_bottom";
import { CommonConstants } from '../../common/constants/CommonConstants';
import ItemDictionaryModel from "../../model/ItemDictionaryModel";

@Component
export default struct collect_words{
  @Consume pageInfos: NavPathStack;
  @StorageLink("persistedMapString") persistedMapString: Map<number, string> = new Map<number, string>([]);
  @State egDivider: DividerTmp = new DividerTmp(1, 10, 10, '#ffe9f0f0')
  build() {
    NavDestination() {
      List({space:10}){
        ForEach(Array.from(this.persistedMapString.entries()), (item: [number, string]) => {
          ListItem(){
            Column({space:CommonConstants.SPACE_10}) {
              Row({ space: 6 }) {
                Text(`${item[1]}`)
                  .fontWeight(CommonConstants.FONT_WEIGHT_350)
                  .fontSize(18)
                Blank()
                // Text(item.detail)
                Image($r('app.media.delete'))
                  .size({ width: 15 })
                  .fillColor($r('app.color.warnIcon'))
                  .onClick(()=>{
                    this.persistedMapString.delete(item[0])
                  })
              }.onClick(() => {
                // const label = '高兴'; // 替换为实际的标签值
                const wordInfo = ItemDictionaryModel.findByWordName(`${item[1]}`);
                if (wordInfo!=null) {
                  // 将词汇信息传递给跳转页面
                  this.pageInfos.pushPath({ name: 'Word', param: wordInfo });
                } else {
                  console.log('词汇未找到');
                }
              })
              .width('100%').padding({left:20,right:20})
            }.padding({top:15})
          }
        })
      }
      .width('100%')
      .height('100%')
      .divider(this.egDivider)
    }.title('收藏词汇')
  }
}

