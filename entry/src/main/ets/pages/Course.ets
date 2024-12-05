import { CourseCategoryEnum } from '../model/CourseCategoryModel';
import DividerTmp from '../model/DividerTmpModel';
import ItemVideoModel from '../model/ItemVideoModel';
import course_swiper from '../view/course/course_swiper';
import VideoItem from '../viewmodel/VideoItem';


@Component
export default struct Course {
  @Consume pageInfos: NavPathStack;
  @State egDivider: DividerTmp = new DividerTmp(1, 10, 10, '#ffe9f0f0')
  @State clickUp: number[] = []
  @State image_iconOne: ResourceStr = $r('app.media.bottom')
  @State image_iconTwo: ResourceStr = $r('app.media.bottom')

  @Builder
  CourseCategoryNameBuilder(items: VideoItem[]) {
    ForEach(items, (item: VideoItem) => {
      Row() {
        Text(item.CourseCategoryName).fontSize(20)
      }.width('100%')
      .onClick(() => {
        if (!this.clickUp.includes(item.CourseID)) {
          this.clickUp.push(item.CourseID)
        } else if (this.clickUp.includes(item.CourseID)) {
          this.removeItem(item.CourseID)
        }
        this.iconUp()
      })
    })
  }

  removeItem(itemToRemove: number) {
    this.clickUp = this.clickUp.filter(item => item !== itemToRemove);
  }

  iconUp() {
    this.clickUp.includes(CourseCategoryEnum.CourseOne) ? this.image_iconOne = $r('app.media.top') :
      this.image_iconOne = $r('app.media.bottom')
    this.clickUp.includes(CourseCategoryEnum.CourseTwo) ? this.image_iconTwo = $r('app.media.top') :
      this.image_iconTwo = $r('app.media.bottom')
  }

  @Builder
  CourseContentBuilder(items: VideoItem[]) {
    List({ space: 10 }) {
      ForEach(items, (item: VideoItem) => {
        ListItem() {
          Column() {
            Row() {
              Image(item.course_image).width(50).margin({ left: 10 })
              Text(item.videoName).fontSize(18).fontWeight(300).textAlign(TextAlign.Start)
              Blank()
              Image($r('app.media.right'))
                .size({ width: 15 })
                .fillColor($r('app.color.light_gray'))
                .margin({ right: 15 })
            }
            .width('100%')
          }
        }.onClick(() => {
          let param = item
          this.pageInfos.pushPath({ name: 'course_video', param })
        })
        .margin({ top: 5 })
      })
    }
    .width('100%')
    .height('auto')
    .divider(this.egDivider)
  }

  build() {
    NavDestination() {
      Column() {
        Column() {
          course_swiper()
        }
        .width('100%')
        .height(180)

        //课程视频
        Row() {
          Text('教学课程')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .margin({ left: 18 })
        }
        .width('100%')
        .margin({ top: 20 })

        Row() { //手语启航
          this.CourseCategoryNameBuilder(ItemVideoModel.list(CourseCategoryEnum.CourseOne))
          Image(this.image_iconOne)
            .width(16)
            .margin({ top: 8 })
            .height(16)
            .offset({ x: -370 })
            .zIndex(-1)
        }.margin({ left: 10, top: 15 }).width('90%')

        if (this.clickUp.includes(CourseCategoryEnum.CourseOne)) {
          Column() {
            this.CourseContentBuilder(ItemVideoModel.list(CourseCategoryEnum.CourseOne))
          }
        }
        Row() { //智绘手语
          this.CourseCategoryNameBuilder(ItemVideoModel.list(CourseCategoryEnum.CourseTwo))
          Image(this.image_iconTwo)
            .width(16)
            .margin({ top: 8 })
            .height(16)
            .offset({ x: -370 })
            .zIndex(-1)
        }.margin({ left: 10, top: 20 }).width('90%')

        if (this.clickUp.includes(CourseCategoryEnum.CourseTwo)) {
          Column() {
            this.CourseContentBuilder(ItemVideoModel.list(CourseCategoryEnum.CourseTwo))
          }
        }

      }
      .height('100%')
      .width('100%')
      .borderColor($r('app.color.page_background'))
    }.title('课程')
  }
}
