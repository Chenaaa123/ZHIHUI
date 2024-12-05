
import videoPlayer from "./videoPlayer"

@Component
export default struct home_bottom_video{
  build() {
    Column(){
      Column(){
        videoPlayer()
      }
      .width('94%')
      .height(200)
      .offset({y:-40})
      Row(){
        Text('[感谢]').fontWeight(400).fontSize(18).margin({right:5})
        Text('一手(或双手)伸拇指，向前弯动两下，面带笑容。')
          .width('80%')
          .maxLines(1)
          .fontSize(14)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }.offset({y:-15})
    }
  }
}