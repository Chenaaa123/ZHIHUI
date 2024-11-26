//搜索框

@Component
export default struct search_Header{
  build() {
    Row(){
      Row({space:8}){
        Search({placeholder:'搜索搜索搜索搜索搜索'})
          .textFont({size:18})
          .layoutWeight(1)
        //角标
        Badge({count:1,position:BadgePosition.RightTop,style:{fontSize:12}}){
          Image($r('app.media.history'))
            .width(24)
        }
      }
    }
    .width('90%')
  }
}