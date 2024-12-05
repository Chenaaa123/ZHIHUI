PersistentStorage.persistProp('signature', "请编辑个性签名");

@Component
export default struct signature {
  @StorageLink('signature') signature: string = ''
  @Consume pageInfos: NavPathStack;

  build() {
    NavDestination() {
      RelativeContainer() {
        TextInput({ placeholder: this.signature })
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
            this.signature = value
          })
      }
      .height('100%')
      .width('100%')
    }
    .title('个性签名')
  }
}