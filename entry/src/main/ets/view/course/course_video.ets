import { JSON } from '@kit.ArkTS'

import { router } from '@kit.ArkUI';
import VideoItem from '../../viewmodel/VideoItem';

// export class VideoData {
//   id?: number;
//   video?: Resource;
//   videoName?: string;
// }

@Component
export default struct Course{
  // videoData: string | Resource | undefined;
  //  @Prop item: Videoitem;
  // @State innerResource: Resource = $rawfile('hand_first1.mp4');
  @Consume pageInfos: NavPathStack;
  @State wordDataList: Array<VideoItem> = [];

  aboutToAppear(): void {
    let data = JSON.stringify(this.pageInfos.getParamByName('course_video'));
    this.wordDataList = JSON.parse(data) as Array<VideoItem>;
    // console.log(this.innerResource);
  }

  build() {
    NavDestination() {
      RelativeContainer() {
        ForEach(this.wordDataList, (item: VideoItem) => {
          Video({
            src: item.video
          })
            .objectFit(ImageFit.Contain)
            .alignRules({
              middle: { anchor: '__container__', align: HorizontalAlign.Center },
              center: { anchor: '__container__', align: VerticalAlign.Center }
            })
            .width('100%')
            .height(200)
            .muted(true)
            .controls(true)
            .autoPlay(true);
        })
      }.width('100%')
      .height('100%')
      .backgroundColor(Color.Black);
    }.title('视频选集')
  }
}