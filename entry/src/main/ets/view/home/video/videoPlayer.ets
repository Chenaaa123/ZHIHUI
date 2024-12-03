@Component
export default struct videoPlay {
  private videos: Resource[] = [
    $rawfile('video/thank_video.mp4')
  ];
  private currentIndex: number = 0;

  build() {
    Column() {
      Video({
        src: this.videos[this.currentIndex],
      })
        .muted(false) // 设置是否静音
        .controls(false) // 设置是否显示默认控制条
        .autoPlay(true) // 设置是否自动播放
        .loop(true) // 设置是否循环播放
        .borderRadius(10)
        // .objectFit(ImageFit.Contain) //设置视频适配模式
      // Button("Next Video")
      //   .onClick(() => {
      //     // this.nextVideo();
      //   })
    }
  }

  // nextVideo() {
  //   this.currentIndex = (this.currentIndex + 1) % this.videos.length;
  //   // 重新构建组件以更新视频源
  //   this.videos();
  // }
}
