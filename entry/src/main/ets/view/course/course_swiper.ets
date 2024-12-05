@Component
export default struct course_swiper {
  build() {
    Swiper() { //轮播图
      Image($r('app.media.course_slideshow1'))
      Image($r('app.media.course_slideshow2'))
    }

    .autoPlay(true)
    .borderRadius(10)
  }
}