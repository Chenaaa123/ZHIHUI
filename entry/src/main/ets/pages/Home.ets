//首页主布局
import { CommonConstants } from '../common/constants/CommonConstants'
import ItemDictionaryModel from '../model/ItemDictionaryModel'
import home_bottom_componentOne from '../view/home/recommend/home_bottom_recommend'
import home_bottom_componentThree from '../view/home/video/home_bottom_video'
import home_bottom_componentTwo from '../view/home/home_bottom_attention'
import home_bottom_recommend from '../view/home/recommend/home_bottom_recommend'
import home_bottom_video from '../view/home/video/home_bottom_video'
import home_bottom_attention from '../view/home/home_bottom_attention'


@Builder export function HomeBuilder(name: string, param: Object) {
  Home()
}
@Component
export default struct Home{

    @Consume pageInfos: NavPathStack


  @Builder buttonBuilder(label:string){
      Button(label)
        .fontSize(15)
        .fontColor($r('app.color.lightest_primary_color'))
        .backgroundColor($r('app.color.secondary_color'))
        .controlSize(ControlSize.SMALL)
        .onClick(() => {

          const wordInfo = ItemDictionaryModel.findByWordName(label);
          if (wordInfo!=null) {
            // 将词汇信息传递给跳转页面
            this.pageInfos.pushPath({ name: 'Word', param: wordInfo });
          } else {
            console.log('词汇未找到');
          }
        })
  }
    /*          bottom菜单栏构造     */
    @Builder MenuBuilder(image:string,label:string,pageName:string){
      Column(){
        Image($r(image))
          .width('auto')
          .height(40)
        Text(label)
          .fontSize('$r(CommonConstants.DEFAULT_16)')
          .fontWeight('$r(CommonConstants.FONT_WEIGHT_400)')
          .margin({top:5})
      }
      .width('80')
      .height(60)
      .justifyContent(FlexAlign.Start)
      .onClick(() => {
        this.pageInfos.pushPath({ name: pageName });
      })
    }

    //推荐、关注、视频
    @State currentIndex: number =0
    @Builder tabBuilder(title: string, targetIndex: number, selectedImg: Resource) {
      Stack() {
        Text(title)
          .fontColor(this.currentIndex === targetIndex ? '#ff010c11' : '#6B6B6B')
          .fontWeight(this.currentIndex === targetIndex ? 470:450)
          .fontSize(20)
        if(this.currentIndex === targetIndex){
          Image(selectedImg)
            .size({ width: 40, height: 20 })
            .fillColor($r('app.color.primary_color'))
            .zIndex(-1)
            .margin({top:15})

        }else {
          Image(selectedImg)
            .size({ width: 0, height: 0 })
        }
      }
      .width('100%')
      .height(50)
    }

  build() {

    RelativeContainer() {
      Column() {
        RelativeContainer(){
          // Logo图片
          Image($r('app.media.Logo'))
            .height(72)
            .alignRules({
              middle:{anchor:"__container__",align:HorizontalAlign.Center}
            })
            .interpolation(ImageInterpolation.High)
            .margin({top:10})
        }
        .height(80)
        //按钮

        Row({ space: CommonConstants.SPACE_6 }) {
              this.buttonBuilder('感谢')
              this.buttonBuilder('高兴')
              this.buttonBuilder('抱歉')
              this.buttonBuilder('我们')
        }
        .height(23)
        .margin({bottom:4})
        .width('80%')

        //搜索框
        Image($r('app.media.searchMain'))
          .width('80%')
          .margin({top:10})
          .onClick(() => {
            this.pageInfos.pushPath({ name: 'Search_word'});
          })

        //功能栏
        Row({space:CommonConstants.SPACE_12}){
          this.MenuBuilder('app.media.dictionary', '词典','Dictionary')
          this.MenuBuilder('app.media.class', '课程','Course')
          this.MenuBuilder('app.media.forum', '留言','Leave_word')
        }
        .backgroundColor('#FFFF')
        .margin({top:15})
        .width('90%')
        .height(80)
        .borderRadius(100)
        .justifyContent(FlexAlign.Center)
        .padding(0)
      }
      .backgroundImage($r('app.media.topbg'))
      .backgroundImageSize({height:'30%',width: '100%'})
      .height('100%')
      .width('100%')
      .justifyContent(FlexAlign.Start)

      //广告
        Row(){
          Image($r('app.media.advertisement'))
            .width("100%")
            .position({top:250,left:'5%'})
        }.width('90%')
        .margin({top:20})


      /*   底部    */
      Column() {
        Tabs(){
          TabContent() {
            home_bottom_recommend()
          }
          .tabBar(this.tabBuilder('推荐', 0, $r('app.media.rectangle')))
          TabContent() {
            home_bottom_attention()
          }
          .tabBar(this.tabBuilder('关注', 1, $r('app.media.rectangle')))
          TabContent() {
            home_bottom_video()
          }
          .tabBar(this.tabBuilder('视频', 2, $r('app.media.rectangle')))
         }.onChange(index =>this.currentIndex = index)
      }   //bottom样式
        .width('100%')
        .position({top:330})
        .height(400)

      }  //整体样式
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.page_background'))
    }
  }


