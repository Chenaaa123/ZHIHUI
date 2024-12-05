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
        .muted(false)// 设置是否静音
        .controls(false)// 设置是否显示默认控制条
        .autoPlay(true)// 设置是否自动播放
        .loop(true)// 设置是否循环播放
        .borderRadius(10)
    }
  }
}
