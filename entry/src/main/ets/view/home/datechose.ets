//日期选择

@CustomDialog
export struct datechose {
  selectedDate: Date = new Date()
  controller: CustomDialogController

  build() {
    Column({ space: 12 }) {
      DatePicker({
        start: new Date('2024-1-1'),
        end: new Date('2024-12-31'),
        selected: this.selectedDate, // 绑定到可观察的属性
      })
        .onDateChange((value: Date) => {
          // this.selectedDate.setFullYear(value.year, value.month, value.day)
        })


      Row() {
        Button('取消')
          .width(120)
          .backgroundColor(Color.Green)
          .onClick(() => { // 使用正确的点击事件处理方式
            this.controller.close()
          })

        Button('确定')
          .width(120)
          .backgroundColor(Color.Green)
          .onClick(() => { // 使用正确的点击事件处理方式
            // 保存到全局
            AppStorage.SetOrCreate('selectedDate', this.selectedDate.getTime())
            this.controller.close()
          })
      }
    }
    .padding(12)
  }
}