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
  navDestination(name: string, param :string) {
    if (name === 'Word') {
      Word()
    } else if (name === 'Dictionary') {
      Dictionary()
    }
    else if (name === 'Course') {
      Course()
    }else if (name === 'Leave_word') {
      Leave_word()
   }
    else if (name === 'Search_word') {
      Search_word()
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