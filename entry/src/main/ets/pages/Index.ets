import course_video from '../view/course/course_video'
import recommendNews from '../view/home/recommend/recommendNews'
import account_info from '../view/mine/account/account_info'
import account_management from '../view/mine/account/account_management'
import signature from '../view/mine/account/signature'
import user_name from '../view/mine/account/user_name'
import Collect_words from '../view/mine/mine_top/Collect_words'
import about_us from '../view/mine/setting/about_us'
import contact_us from '../view/mine/setting/contact_us'
import setting_info from '../view/mine/setting/setting_info'
import study_record from '../view/mine/study_record'
import Course from './Course'
import Dictionary from './Dictionary'
import Home from './Home'
import Leave_word from './Leave_word'
import Mine from './Mine'
import Search_word from './Search_word'
import Word from './Word'

interface Tabs {
  name: string,
  icon: ResourceStr
}

const  tabs: Tabs[] = [
  {name:'首页',icon:$r('app.media.index')},
  {name:'我的',icon:$r('app.media.mine')}
]

@Entry
@Component
struct Index {

  //关闭全局转场
  aboutToAppear(): void {
    this.pageInfos.disableAnimation(true)
  }

  @State activeName: string = '首页'
  // tabs
  @Builder
  tabBarBuilder() {
    Row() {
      ForEach(tabs, (item:Tabs) => {
        Column() {
          Image(item.icon).width(24).aspectRatio(1).fillColor(this.activeName === item.name ? $r('app.color.primary_color') : $r('app.color.gray'))
          Text(item.name).fontColor(this.activeName === item.name ? $r('app.color.primary_color') : $r('app.color.gray'))
        }.onClick(() => {
          this.activeName = item.name
        })
      })
    }.width('100%').justifyContent(FlexAlign.SpaceAround)
  }

  // // 标题
  // @Builder
  // titleBuilder() {
  //   Row() {
  //     Text('title').fontWeight(700)
  //   }
  //   .width('100%')
  //   .justifyContent(FlexAlign.Center)
  // }
  //
  // // 顶部icon
  // @Builder
  // NavigationMenus() {
  //   Row() {
  //     Image($r('app.media.app_icon'))
  //       .width(24).aspectRatio(1)
  //     Image($r('app.media.app_icon'))
  //       .width(24)
  //       .height(24)
  //     Image($r('app.media.app_icon'))
  //       .width(24)
  //       .height(24)
  //   }.width('100%').justifyContent(FlexAlign.SpaceAround)
  // }

  // 路由容器
  @Builder
  navDestination(name: string) {
    if (name === 'Word') {
      Word()
    } else if (name === 'Dictionary') {
      Dictionary()
    }
    else if (name === 'Course') {
      Course()
    }
    else if (name === 'Leave_word') {
      Leave_word()
   }
    else if (name === 'Search_word') {
      Search_word()
    }
    else if (name === 'Collect_words') {
      Collect_words()
    }
    else if (name === 'course_video'){
      course_video()
    }
    else if (name === 'recommendNews'){
      recommendNews()
    }
    else if (name === 'study_record') {
      study_record()
    }
    else if (name === 'account_info') {
      account_info()
    }
    else if (name === 'signature') {
      signature()
    }
    else if (name === 'user_name') {
      user_name()
    }
    else if (name === 'account_management') {
      account_management()
    }
    else if (name === 'setting_info') {
      setting_info()
    }
    else if (name === 'about_us') {
      about_us()
    }
    else if (name === 'contact_us') {
      contact_us()
    }
  }



  //路由栈, (控制跳转）
  // @Provide navStack: NavPathStack = new NavPathStack()
  @Provide pageInfos: NavPathStack = new NavPathStack()
  build() {
    Navigation(this.pageInfos) {
      if (this.activeName === '首页') {
        Home()
      }
      else {
        Mine()
      }
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.page_background'))
    .toolbarConfiguration(this.tabBarBuilder) // 设置自定义tabBar
    .navDestination(this.navDestination) // 设置路由容器
    // .title(this.titleBuilder, {
    //   backgroundColor: Color.Blue,
    // }) // 设置标题
    // .titleMode(NavigationTitleMode.Mini) // 标题模式
    // .menus(this.NavigationMenus) // 顶部图标
    .hideTitleBar(false) // 是否隐藏标题栏
    .hideNavBar(false) // 是否隐藏导航栏, 隐藏Navigation的导航栏，包括标题栏、内容区和工具栏。
    // .backgroundColor(Color.Pink)
  }
}