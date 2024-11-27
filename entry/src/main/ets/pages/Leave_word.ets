import { router } from '@kit.ArkUI';



@Component
export default struct Leave_word {
  @Consume pageInfos: NavPathStack
  // @State message: string = 'Hello World';

  build() {
    NavDestination(){
      Column(){
        Text('AAAA')
        //2.列表
        // dictionaryList()

      }
      .height('100%')
      .width('100%')
    }
  }

}