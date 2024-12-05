import mine_bottom from '../view/mine/mine_bottom'
import mine_top from '../view/mine/mine_top/mine_top'


@Component
export default struct Mine {
  @Consume pageInfos: NavPathStack;
  build() {
      Column() {
        //顶部
        mine_top()
        //列表
        mine_bottom()

      }.width('100%')
      .height('100%')

  }
}





