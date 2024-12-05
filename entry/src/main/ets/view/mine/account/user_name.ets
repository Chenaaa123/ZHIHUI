PersistentStorage.persistProp('user_name', "请编辑用户名");

@Component
export default struct user_name {
  @StorageLink('user_name') user_name: string = ''
  @Consume pageInfos: NavPathStack;

  build() {
    NavDestination() {
      RelativeContainer() {
        TextInput({ placeholder: this.user_name })
          .placeholderFont({ size: 16, weight: 400 })
          .width(336)
          .height(56)
          .fontSize(16)
          .fontColor('#182431')
          .borderRadius(5)
          .alignRules({
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
          .backgroundColor('#ffc4d8f6')
          .onChange((value: string) => {
            this.user_name = value
          })
      }
      .height('100%')
      .width('100%')
    }
    .title('用户名')
  }
}