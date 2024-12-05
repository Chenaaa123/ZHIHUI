import { CommonConstants } from '../../../common/constants/CommonConstants';
import DividerTmp from '../../../model/DividerTmpModel';
import ItemDictionaryModel from "../../../model/ItemDictionaryModel";

@Component
export default struct collect_words {
  @Consume pageInfos: NavPathStack;
  @StorageLink("persistedMapString") persistedMapString: Map<number, string> = new Map<number, string>([]);
  @State egDivider: DividerTmp = new DividerTmp(1, 10, 10, '#ffe9f0f0')

  build() {
    NavDestination() {
      Column() {
        List({ space: 10 }) {
          ForEach(Array.from(this.persistedMapString.entries()), (item: [number, string]) => {
            ListItem() {
              Column({ space: CommonConstants.SPACE_6 }) {
                Row({ space: 6 }) {
                  Text(`${item[1]}`)
                    .fontWeight(CommonConstants.FONT_WEIGHT_350)
                    .fontSize(18)
                    .fontColor(Color.White)
                  Blank()
                  // Text(item.detail)
                  Image($r('app.media.delete'))
                    .size({ width: 15 })
                    .fillColor(Color.Yellow)
                    .onClick(() => {
                      this.persistedMapString.delete(item[0])
                    })
                }
                .width('90%')
                .borderRadius(10)
                .padding(20)
                .margin({ right: '5%', left: '5%' })
                .backgroundColor($r('app.color.primaryEst_color'))
                .onClick(() => {
                  const wordInfo = ItemDictionaryModel.findByWordName(`${item[1]}`);
                  if (wordInfo != null) {
                    this.pageInfos.pushPath({ name: 'Word', param: wordInfo });
                  } else {
                    console.log('词汇未找到');
                  }
                })
              }.padding({ top: 15 })
            }
          })
        }
        .width('100%')
        .height('100%')
        .divider(this.egDivider)
      }
    }.title('收藏词汇').backgroundColor($r('app.color.page_background'))
  }
}

