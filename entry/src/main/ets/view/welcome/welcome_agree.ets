import { router } from "@kit.ArkUI";

PersistentStorage.persistProp('welcome_approve', 0);
@CustomDialog
  export default struct welcome_agree {
  @StorageLink('welcome_approve') welcome_approve: number = 0
  agree: CustomDialogController// 设置默认值
 confirm: () => void= () => {};
  cancel: () => void= () => {};

  build() {
    Column(){
      //1、标题
      Text('欢迎使用指麾')
        .textAlign(TextAlign.Center)
        .fontWeight(FontWeight.Bold)
        .fontSize(20)
        .margin({bottom:15})
      //2、内容
     Text('      感谢您信任并使用指麾!我们将通过《用户协议》和《指麾隐私政策》帮助您了解我们收集、使用、存储和共享个人信息的情况,特别是我们所采集的个人信息类型与用途的对应关系。此外,您还能了解到您所享有的相关权利及实现途径。如您同意,请点击下方按钮开始接受我们的服务。')
       .letterSpacing(2)
       .fontSize(15)
       .padding(5)
       .margin({bottom:10})
       .borderRadius(5)
       // .backgroundColor($r('app.color.welcome_color'))
      //3、按钮
     Button('同意')
        .width(200)
        .margin({bottom:5})
       .backgroundColor($r('app.color.primary_color'))
       .onClick(() => {
         this.welcome_approve  = 1
        this.confirm()
         this.agree.close()
       })
     Button('不同意')
        .width(200)
       .backgroundColor($r('app.color.page_background'))
       .fontColor($r('app.color.primary_color'))
       .onClick(() => {
         this.cancel()
         this.agree.close()
       })
    }.width('100%')
       .padding(10)
    //.backgroundColor($r('app.color.lightest_primary_color'))
    .backgroundColor($r('app.color.index_page_background'))
    .borderRadius(5)

  }
}

