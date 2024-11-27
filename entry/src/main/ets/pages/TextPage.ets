
@CustomDialog
struct historyDialog {
  @Prop  history: string[]
  controller?: CustomDialogController

  build() {
    Column() {
      Text('我是内容').fontSize(16).margin({ bottom: 10 })
      ForEach(this.history, (item:string) => {
        Text(item).fontSize(14).margin({ bottom: 5 })
      })
    }
  }
}

@Entry
@Component
struct CustomDialogUser {

  @State textValue: string = ''
  @State inputValue: string = 'click me'
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: historyDialog(),    //对话框构造器生成对话框内容
    autoCancel: true,         //点击对话框外关闭
    alignment: DialogAlignment.Center,
    offset: { dx: 0, dy: -20 },   //向上偏移20
    gridCount: 4,         //网格计数
    customStyle: false,     //自定义样式
    backgroundColor: 0xd9ffffff,
    cornerRadius: 20,
    width: '80%',
    height: '100%',
    borderWidth: 1,
    borderStyle: BorderStyle.Dashed,//使用borderStyle属性，需要和borderWidth属性一起使用
    borderColor: $r('app.color.primary_color'),//使用borderColor属性，需要和borderWidth属性一起使用
    shadow: ({ radius: 20, color: Color.Grey, offsetX: 50, offsetY: 0}),
  })

  // 在自定义组件即将析构销毁时将dialogController置空
  aboutToDisappear() {
    this.dialogController = null // 将dialogController置空
  }

  build() {
    Column() {
      Button(this.inputValue)
        .onClick(() => {
          if (this.dialogController != null) {
            this.dialogController.open()
          }
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 5 })
  }
}