@Component
export default struct Study_Record{
  @Consume pageInfos: NavPathStack;
  build() {
    NavDestination(){
      Text('wsdsb')
        .fontSize(14)
    }.title('学习记录')
  }
}
