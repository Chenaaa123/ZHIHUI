import { promptAction } from "@kit.ArkUI";
import ItemDictionaryModel from "../model/ItemDictionaryModel";


@Component
export default struct Search_word {
  @State changeValue: string = ''
  @State submitValue: string = ''
  @Consume pageInfos: NavPathStack;
  @State history: string[] = []; // 用于存储历史记录

  // @State textValue: string = ''
  // dialogController: CustomDialogController | null = new CustomDialogController({
  //   builder: historyDialog(),    //对话框构造器生成对话框内容
  //   autoCancel: true,         //点击对话框外关闭
  //   alignment: DialogAlignment.Center,
  //   offset: { dx: 0, dy: -20 },   //向上偏移20
  //   gridCount: 4,         //网格计数
  //   customStyle: false,     //自定义样式
  //   backgroundColor: 0xd9ffffff,
  //   cornerRadius: 20,
  //   width: '80%',
  //   height: '100%',
  //   borderWidth: 1,
  //   borderStyle: BorderStyle.Dashed,//使用borderStyle属性，需要和borderWidth属性一起使用
  //   borderColor: $r('app.color.primary_color'),//使用borderColor属性，需要和borderWidth属性一起使用
  //   shadow: ({ radius: 20, color: Color.Grey, offsetX: 50, offsetY: 0}),
  // })

  // // 在自定义组件即将析构销毁时将dialogController置空
  // aboutToDisappear() {
  //   this.dialogController = null // 将dialogController置空
  // }

  addToHistory(word: string) {
    // 避免重复添加相同的词汇
    if (!this.history.includes(word)) {
      this.history.unshift(word); // 将新词汇添加到数组开头
    }
  }

  showHistory() {
    // 这里可以跳转到一个展示历史记录的页面，或者直接在当前页面展示历史记录
    console.log('历史记录:', this.history);
    // 示例：弹出一个提示框展示历史记录
    promptAction.showToast({
      message: `历史记录: ${this.history.join(', ')}`,
      duration: 5000, // 持续时间为5秒
    });
  }

  removeFromHistory(word: string) {
    // 从历史记录数组中移除指定的词汇
    this.history = this.history.filter(item => item !== word);
  }

  clearHistory() {
    // 清空历史记录数组
    this.history = [];
  }

  build() {
    NavDestination() {
      Column(){
      Row({ space: 10 }) {
        Search({ value: this.changeValue, placeholder: '请输入要查询的内容' })
          .searchButton('搜索')
          .searchIcon({
            src: $r('app.media.searchicon')
          })
          .cancelButton({
            style: CancelButtonStyle.CONSTANT,
            icon: {
              src: $r('app.media.cancel')
            }
          })
          .width('80%')
          .height(40)
          .layoutWeight(1)
          .maxLength(20)

          .backgroundColor('#F5F5F5')
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .textFont({ size: 14, weight: 400 })
          .onSubmit((value: string) => {
            this.submitValue = value
            const wordInfo = ItemDictionaryModel.findByWordName(this.submitValue);
            if (wordInfo != null) {
              // 将词汇信息传递给跳转页面
              this.pageInfos.pushPath({ name: 'Word', param: wordInfo });
              // 添加搜索词到历史记录
              this.addToHistory(this.submitValue);
            } else {
              promptAction.showToast({
                message: '未找到该词汇',
                duration: 404
              })
            }
          })
          .onChange((value: string) => {
            this.changeValue = value
          })
          .margin({ left: 8 })
        //历史 角标
        Badge({ count: 0, position: BadgePosition.RightTop, style: { fontSize: 12 } }) {
          Image($r('app.media.history'))
            .width(24)
            .margin({ right: 12 })
            .onClick(() => {
              // 点击角标时展示历史记录
              this.showHistory();
            });
            // .onClick(() => {
            //   if (this.dialogController != null) {
            //     this.dialogController.open()
            //   }
            // })
        }
      }.width('100%')

        //历史搜索
        Row(){
          Text('历史搜索')
            .margin({top:5,left:10})
            .fontWeight(300)
            .fontSize(18)
          Image($r('app.media.delete'))
            .height(20)
            .width('auto')
            .margin({top:5,right:15})
            .fillColor($r('app.color.light_gray'))
            .onClick(()=>{
              this.clearHistory()
            })
        }.width('100%').height(50).justifyContent(FlexAlign.SpaceBetween)

      // 显示历史记录按钮
      if (this.history.length > 0) {
        Row({ space: 5 }) {
          ForEach(this.history,(label:string)=>{
            Button(label)
              .fontSize(15)
              .fontColor($r('app.color.lightest_primary_color'))
              .backgroundColor('#F5F5F5')
              .controlSize(ControlSize.SMALL)
              .onClick(() => {
                // const label = '高兴'; // 替换为实际的标签值
                const wordInfo = ItemDictionaryModel.findByWordName(label);
                if (wordInfo!=null) {
                  // 将词汇信息传递给跳转页面
                  this.pageInfos.pushPath({ name: 'Word', param: wordInfo });
                } else {
                  console.log('词汇未找到');
                }
              })
          })
        }.justifyContent(FlexAlign.Start)
        .margin({ top: 6 ,left:20});
          }
      }.alignItems(HorizontalAlign.Start)
    }
  }
}
