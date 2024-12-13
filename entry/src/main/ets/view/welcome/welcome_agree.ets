import { router } from "@kit.ArkUI";
import { Core } from "@ohos/hypium";


PersistentStorage.persistProp('welcome_approve', 0);
@CustomDialog
  export default struct welcome_agree {
  @StorageLink('welcome_approve') welcome_approve: number = 0
  agree: CustomDialogController// 设置默认值
 confirm: () => void= () => {};
  cancel: () => void= () => {};
  autoCancel: boolean = false;
  @State height_text: string =''
  @State visibility_text: Visibility = Visibility.Visible
  @State visibility_again: Visibility = Visibility.None
  time = new Date()



  build() {
    Column(){
      Column(){
        //1、标题
        Text('欢迎使用指麾')
          .textAlign(TextAlign.Center)
          .fontWeight(FontWeight.Bold)
          .fontSize(20)
          .margin({bottom:15})
        //2、内容
        //  Text('      感谢您信任并使用指麾!我们将通过《用户协议》和《指麾隐私政策》帮助您了解我们收集、使用、存储和共享个人信息的情况,特别是我们所采集的个人信息类型与用途的对应关系。此外,您还能了解到您所享有的相关权利及实现途径。如您同意,请点击下方按钮开始接受我们的服务。'){
        Text(){
          Span('感谢您信任并使用指麾!我们将通过')
          Span('《用户协议》和《指麾隐私政策》')
            .fontColor('red')
            .onClick(()=>{
              this.visibility_text = Visibility.None   //小窗隐藏
              this.visibility_again = Visibility.Visible    //大窗显示
              this.height_text = '100%'
            })
          Span('帮助您了解我们收集、使用、存储和共享个人信息的情况,特别是我们所采集的个人信息类型与用途的对应关系。此外,您还能了解到您所享有的相关权利及实现途径。如您同意,请点击下方按钮开始接受我们的服务。')


        }
        .letterSpacing(2)
        .fontSize(15)
        .padding(5)
        .margin({bottom:10})
        .borderRadius(5)
        // .backgroundColor($r('app.color.welcome_color'))
        //4、协议

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
      }

      .visibility(this.visibility_text)
      .width('100%')
      .padding(10)
      .backgroundColor($r('app.color.index_page_background'))
      .borderRadius(5)

      Column(){
        RelativeContainer(){
          Text('《指麾应用隐私政策》')     //大窗顶部
            .fontWeight(FontWeight.Bold)
            .fontSize(20)
            .alignRules({
              middle: {anchor:'__container__',align:HorizontalAlign.Center}
            })
          Image($r('app.media.input_delete'))
            .onClick(()=>{
              this.visibility_text = Visibility.Visible     //小窗用户协议显示
              this.visibility_again = Visibility.None       //大窗隐藏
              this.height_text = ''
            })
            .width(20)
            .alignRules({
              middle: {anchor:'__container__',align:HorizontalAlign.End}
            })
            .margin({right:50})
        }
        .margin({top:10})
        .height(30)


        TextArea({
          text:
          '       指麾应用（以下简称“本应用”）非常重视用户的隐私保护。为了给您提供更优质、更安全的服务，本应用根据《中华人民共和国网络安全法》、《中华人民共和国个人信息保护法》等相关法律法规，制定本隐私政策。本隐私政策详细说明了本应用在收集、使用、存储、分享和保护用户个人信息方面的具体做法。请您在使用本应用前仔细阅读本隐私政策，如果您不同意本隐私政策的任何内容，请不要使用本应用。\n' +
          '一、收集的个人信息\n' +
          '1.1 当您注册本应用账号时，我们需要收集您的手机号码、密码等基本信息。\n' +
          '1.2 为了确保本应用为您提供服务，我们需要收集您的设备信息、操作系统、IP地址、地理位置等。\n' +
          '1.3 在您使用本应用过程中，我们会收集您的浏览记录、搜索记录、交易记录等操作行为信息。\n' +
          '1.4 为实现身份验证、提供个性化服务等功能，我们可能会收集您的身份证号码、面部识别信息、指纹信息等敏感个人信息。\n' +
          '二、个人信息的使用\n' +
          '2.1 我们收集的个人信息将用于以下目的：\n' +
          '（1）为您提供本应用的各项服务；\n' +
          '（2）向您推荐个性化内容，提升用户体验；\n' +
          '（3）实现账号管理、身份验证、安全防范等功能；\n' +
          '（4）开展内部数据分析和研究，优化产品功能；\n' +
          '（5）向您发送通知、公告、营销信息等；\n' +
          '（6）符合法律法规规定的其他用途。\n' +
          '2.2 我们承诺，未经您同意，不会将您的个人信息用于本隐私政策未载明的其他用途。\n' +
          '三、个人信息存储\n' +
          '3.1 我们将在中华人民共和国境内存储您的个人信息，并采取必要的技术措施确保信息安全。\n' +
          '3.2 我们会根据业务需要，合理确定个人信息存储期限。超过存储期限的个人信息，我们将采取删除、匿名化处理等方式予以处置。\n' +
          '四、个人信息分享\n' +
          '4.1 我们不会向任何无关第三方出售、出租、出借或以其他方式披露您的个人信息，除非在以下情况下：\n' +
          '（1）事先获得您的明确同意；\n' +
          '（2）根据法律法规规定，或行政机关、司法机关依法要求；\n' +
          '（3）为维护社会公共利益，保护他人合法权益；\n' +
          '（4）与其他合作伙伴共同提供服务，且该合作伙伴承诺遵守本隐私政策；\n' +
          '（5）符合法律法规规定的其他情形。\n' +
          '五、个人信息保护\n' +
          '5.1 我们将采取以下措施保护您的个人信息：\n' +
          '（1）使用加密技术确保数据传输安全；\n' +
          '（2）建立严格的数据访问权限控制机制；\n' +
          '（3）定期进行安全风险评估和漏洞排查；\n' +
          '（4）制定应急预案，应对信息安全事件；\n' +
          '（5）加强对员工的信息安全意识培训。\n' +
          '六、用户的权利\n' +
          '6.1 您有权查询、更正、删除您的个人信息，以及撤回对个人信息使用的同意。\n' +
          '6.2 您可以通过以下方式行使您的权利：\n' +
          '（1）登录本应用，进入“设置”或“个人中心”等模块进行操作；\n' +
          '（2）联系我们的客服人员，表达您的需求。\n' +
          '七、隐私政策的修订\n' +
          '7.1 我们可能会根据业务发展、法律法规变化等原因，对本隐私政策进行修订。\n' +
          '7.2 修订后的隐私政策将在本应用上公布，并在公布后生效。请您关注本隐私政策的最新版本，以便了解我们的个人信息保护措施。\n' +
          '八、联系我们\n' +
          '如果您对本隐私政策有任何疑问或建议，请通过以下方式与我们联系：\n' +
          '客服电话：15579485946\n' +
          '电子邮箱：3158160453@qq.com\n' +
          '指麾应用运营团队\n' +
          `签订日期: ${this.time.getFullYear()}年${this.time.getMonth()+1}月${this.time.getDate()}日\n\n\n`
        })
        .maxLines(210)
        .fontSize(15)
        .lineHeight(22)
          .backgroundColor(Color.White)
      }
      .backgroundColor(Color.White)
      .visibility(this.visibility_again)
      .height(this.height_text)
      .width('100%')
    }
  }
}

