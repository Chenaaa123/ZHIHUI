import { CourseCategoryEnum } from '../model/CourseCategoryModel';
import ItemVideoModel from '../model/ItemVideoModel';
import course_swiper from '../view/course/course_swiper';
import { DividerTmp } from '../view/mine/mine_bottom';
import VideoItem from '../viewmodel/VideoItem';


@Component
export default struct Course {
  @Consume pageInfos: NavPathStack;
  @State egDivider: DividerTmp = new DividerTmp(1, 10, 10, '#ffe9f0f0')
  @State clickUp : number[] =[]
  // @State image_icon: { [key: string]: ResourceStr } = {}
  // @State image_icon[item.CourseCategoryName as string] : ResourceStr = $r('app.media.bottom')
  @State image_iconOne : ResourceStr = $r('app.media.bottom')
  @State image_iconTwo : ResourceStr = $r('app.media.bottom')
  @Builder CourseCategoryNameBuilder(items: VideoItem[]) {
    ForEach(items, (item: VideoItem) => {
      Row() {
        Text(item.CourseCategoryName).fontSize(20)
      }.width('100%')
      .onClick(() => {
        if(!this.clickUp.includes(item.CourseID)){
          // this.image_icon = $r('app.media.top')
          this.clickUp.push(item.CourseID)
        }
        else if (this.clickUp.includes(item.CourseID)){
          // this.image_icon = $r('app.media.bottom')
          this.removeItem(item.CourseID)
        }
        this.iconUp()
      })
    })
  }

  removeItem(itemToRemove: number) {
    this.clickUp = this.clickUp.filter(item => item !== itemToRemove);
  }

  iconUp(){
    this.clickUp.includes(CourseCategoryEnum.CourseOne) ?  this.image_iconOne = $r('app.media.top') : this.image_iconOne = $r('app.media.bottom')
    this.clickUp.includes(CourseCategoryEnum.CourseTwo) ?  this.image_iconTwo = $r('app.media.top') : this.image_iconTwo = $r('app.media.bottom')
  }

  @Builder CourseContentBuilder(items:VideoItem[]){
    List({space:10}){
      ForEach(items,(item:VideoItem)=>{
        ListItem(){
          Column() {
            Row({ space: 6 }) {
              Image(item.course_image).width(50)
              Text(item.videoName).fontSize(18).fontWeight(300)
              Blank()
              // Text(item.detail)
              Image($r('app.media.right'))
                .size({ width: 15 })
                .fillColor($r('app.color.light_gray'))
                .margin({right:15})
            }
            .width('100%')
          }
        }.onClick(() => {
          let param = item
          this.pageInfos.pushPath({ name:'course_video', param})
        })
        .margin({top:5})
      })
    }
    .width('100%')
    .height('auto')
    .divider(this.egDivider)
  }

  build() {
    NavDestination(){
      Column(){
        Column(){
          course_swiper()
        }
        .width('100%')
        .height(180)

        //课程视频
        Row() {
          Text('教学课程')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .margin({left:18})
        }
        .width('100%')
        .margin({ top: 20 })

        Row(){    //手语启航
          this.CourseCategoryNameBuilder(ItemVideoModel.list(CourseCategoryEnum.CourseOne))
          Image(this.image_iconOne)
            .width(16)
            .margin({ top: 8 })
            .height(16)
            .offset({ x: -370 })
            .zIndex(-1)
        }.margin({left:10,top:15}).width('90%')
        if (this.clickUp.includes(CourseCategoryEnum.CourseOne)){
          Column() {
            this.CourseContentBuilder(ItemVideoModel.list(CourseCategoryEnum.CourseOne))
          }
        }
        Row(){    //智绘手语
          this.CourseCategoryNameBuilder(ItemVideoModel.list(CourseCategoryEnum.CourseTwo))
          Image(this.image_iconTwo)
            .width(16)
            .margin({ top: 8 })
            .height(16)
            .offset({ x: -370 })
            .zIndex(-1)
        }.margin({left:10,top:20}).width('90%')
        if (this.clickUp.includes(CourseCategoryEnum.CourseTwo)){
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






// import { CourseCategoryEnum } from '../model/CourseCategoryModel';
// import ItemVideoModel from '../model/ItemVideoModel';
// import { DividerTmp } from '../view/mine/mine_bottom';
// import VideoItem from '../viewmodel/VideoItem';
// import course_swiper from "../view/Course/course_swiper";
//
//
// @Component
// export default struct Course {
//   @State egDivider: DividerTmp = new DividerTmp(1, 10, 10, '#ffe9f0f0')
//   @State clickUp : number[] =[]
//   @State image_icon[item.CourseCategoryName as string] : ResourceStr = $r('app.media.bottom')
//   @Builder CourseCategoryNameBuilder(items: VideoItem[]) {
//     ForEach(items, (item: VideoItem) => {
//       Row() {
//         // ForEach(items, (item: VideoItem) => {
//         Text(item.CourseCategoryName)
//         // })
//       }.width('90%') // 确保行宽度为100%
//       Image(this.image_icon[item.CourseCategoryName as string])
//         .width(16)
//         .margin({ top: 8 })
//         .height(16)
//         .id(item.CourseCategoryName)
//         .onClick(() => {
//           if(!this.clickUp.includes(item.CourseID)){
//             this.image_icon[item.CourseCategoryName as string] = $r('app.media.top')
//             this.clickUp.push(item.CourseID)
//           }
//           else if (this.clickUp.includes(item.CourseID)){
//             this.image_icon[item.CourseCategoryName as string] = $r('app.media.bottom')
//             this.removeItem(item.CourseID)
//           }
//         });
//     })
//   }
//
//   removeItem(itemToRemove: number) {
//     this.clickUp = this.clickUp.filter(item => item !== itemToRemove);
//   }
//
//   @Builder CourseContentBuilder(items:VideoItem[]){
//     List({space:10}){
//       ForEach(items,(item:VideoItem)=>{
//         ListItem(){
//           Column() {
//             Row({ space: 6 }) {
//               Image(item.course_image).width(50)
//
//               Text(item.videoName).fontWeight(500)
//
//               Blank()
//               // Text(item.detail)
//               Image($r('app.media.right'))
//                 .size({ width: 15 })
//                 .fillColor($r('app.color.light_gray'))
//             }
//             .width('100%')
//           }
//         }
//         // .onClick(() => {
//         //   let param = item
//         //   this.pageInfos.pushPath({ name:'Word', param})
//         // })
//       })
//     }
//     .width('100%')
//     .height('auto')
//     .divider(this.egDivider)
//   }
//
//   build() {
//     NavDestination(){
//       Column(){
//         //1.顶部轮播图
//         Column(){
//           course_swiper()
//         }
//         .width('110%')
//         .height(180)
//         //课程视频
//         Row() {
//           //  Image($r("app.media.3")).width(20).height(20);
//           Text('教学课程')
//             .fontSize(18)
//             .fontWeight(FontWeight.Bold)
//         }
//         .width('100%')
//         .margin({ top: 20 })
//
//
//         Row(){
//           this.CourseCategoryNameBuilder(ItemVideoModel.list(CourseCategoryEnum.CourseOne))
//         }
//         if (this.clickUp.includes(CourseCategoryEnum.CourseOne)){
//           Column() {
//             this.CourseContentBuilder(ItemVideoModel.list(CourseCategoryEnum.CourseOne))
//           }
//         }
//
//         Row(){
//           this.CourseCategoryNameBuilder(ItemVideoModel.list(CourseCategoryEnum.CourseTwo))
//         }
//         if (this.clickUp.includes(CourseCategoryEnum.CourseTwo)){
//           Column() {
//             this.CourseContentBuilder(ItemVideoModel.list(CourseCategoryEnum.CourseTwo))
//           }
//         }
//
//       }
//       .height('100%')
//       .width('100%')
//     }//.title('词典').backgroundColor($r('app.color.opacity_white_66'))
//   }
// }





//
// import ItemVideoModel from "../model/ItemVideoModel";
// import course_swiper from "../view/Course/course_swiper";
//
// interface IRowItem {
//   id?: number;
//   course_Title?: string;
//   course_image?: ResourceStr;
//   course_title?: string;
//   videoName?: string
//   bottom_icon? :ResourceStr
//   type?: string;
//   props?: ResourceStr;
//   onFlagChange?: () => void;
//   onFlagChange1?: () => void;
//   onFlagChange2?: () => void;
// }
//
// @Component
// export default struct Course {
//   @Consume pageInfos: NavPathStack
//   protected scroller: Scroller = new Scroller()
//   @Provide("flag") flag: boolean = false;
//   @Provide("flag1") flag1: boolean = false;
//   @Provide("flag2") flag2: boolean = false;
//   private onFlagChange = () => {
//     animateTo({
//       duration: 650,
//       curve: Curve.Smooth
//     }, () => {
//
//       this.flag = !this.flag;
//     });
//   }
//
//   build() {
//     NavDestination() {
//       Column() {
//         //1.顶部轮播图
//         Column(){
//           course_swiper()
//         }
//         .width('110%')
//         .height(180)
//         //课程视频
//         Row() {
//           //  Image($r("app.media.3")).width(20).height(20);
//           Text('教学课程')
//             .fontSize(18)
//             .fontWeight(FontWeight.Bold)
//         }
//         .width('100%')
//         .margin({ top: 20 })
//
//         Scroll() {
//           Column() {
//             RowItem({
//               props: {
//                 course_Title: '课程1',
//                 bottom_icon : $r('app.media.bottom'),
//                 type: 'DOWN',
//                 onFlagChange: this.onFlagChange
//               }
//             })
//             if (this.flag) {
//               CollapseAndExpand({
//                 items: [
//                   { id: 0, course_image: ($r('app.media.app_icon')), course_title: '第一集' ,videoName: 'one'},
//                   { id: 1, course_image: ($r('app.media.app_icon')), course_title: '第二集', }
//                 ]
//               });
//             }
//           }
//           .width('100%')
//           .height(100)
//           //  .height('auto')
//           .margin({ bottom: 280 })
//           .id('one')
//         }.height('auto')
//         .scrollBar(BarState.Off)
//       }
//       .height('100%')
//       .padding({ right: 30, left: 30 });
//
//     }
//   }
// }
//
// @Component
// struct RowItem {                                 //RowItem
//   public  props: IRowItem = {} as IRowItem
//   @Consume("flag") flag: boolean;
//   @Consume("flag1") flag1: boolean;
//   @Consume("flag2") flag2: boolean;
//   @Consume pageInfos: NavPathStack;
//
//   build() {
//     RelativeContainer() {
//       Row(){
//         Text(this.props.course_Title)
//           .fontSize(15)
//           .fontWeight(FontWeight.Bold)    //.layoutWeight(1)
//           .fontColor(Color.Black)
//           .width(40)
//           .height('100%')
//         Blank()
//         Image(this.props.bottom_icon)
//           .width(16)
//           .margin({ top: 8 })
//           .height(16)
//           .rotate({ angle: !this.flag && this.props.type === 'DOWN' ? 0 : 180 })
//
//           .onClick(() => {
//             if (this.props.onFlagChange) {
//               this.props.onFlagChange();
//             }
//           })
//           .alignRules({
//             end: { anchor: '__container__', align: HorizontalAlign.End }
//           })
//
//       }.width('100%')
//
//       Image(this.props.course_image)
//         .width(50)
//         .height('100%')
//
//       Text(this.props.course_title)
//         .fontSize(12)
//         .height('100%')
//         .textAlign(TextAlign.Center)
//         .width(50)
//         .margin({ left: 55 })
//         .onClick(() => { //页面跳转播放视频
//           // this.submitValue == this.props.id
//           // const videoInfo = ItemVideoModel.findByVideoId(this.submitValue);
//           // if (videoInfo!=null) {
//           //   this.pageInfos.pushPath({ name: 'course_video' , param: videoInfo}) //
//           // }
//         })
//
//
//     }
//     .width('100%')
//     .height(16)
//     .height(30)
//     .margin({ top: 10 })
//   }
// }
//
// @Component
// struct CollapseAndExpand {
//   public  items: IRowItem[] = [];
//
//
//   build() {
//     Column() {
//       ForEach(this.items, (item: IRowItem) => {
//         RowItem({ props: item });
//       }, (item: IRowItem) => item.id !== undefined ? item.id.toString() : '');
//     }
//     .width('100%')
//     .clip(true)
//     //.borderColor(Color.Black)
//     //.borderWidth(10)
//     .height(80)
//   }
// }


