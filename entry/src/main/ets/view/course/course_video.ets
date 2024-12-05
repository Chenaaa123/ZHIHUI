import { JSON } from '@kit.ArkTS'

import VideoItem from '../../viewmodel/VideoItem';


@Component
export default struct Course {
  @Consume pageInfos: NavPathStack;
  @State wordDataList: Array<VideoItem> = [];

  aboutToAppear(): void {
    let data = JSON.stringify(this.pageInfos.getParamByName('course_video'));
    this.wordDataList = JSON.parse(data) as Array<VideoItem>;
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