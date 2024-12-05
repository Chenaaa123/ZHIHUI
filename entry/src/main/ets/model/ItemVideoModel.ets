import VideoItem from '../viewmodel/VideoItem';
import { CourseCategoryEnum } from './CourseCategoryModel';


const videos: VideoItem [] = [
  new VideoItem(0, $rawfile('video/happy_video.mp4'), '【手语启航】第一集', CourseCategoryEnum.CourseOne,
    $r('app.media.app_icon'), '手语启航系列'),
  new VideoItem(1, $rawfile('video/sorry_video.mp4'), '【手语启航】第二集', CourseCategoryEnum.CourseOne,
    $r('app.media.app_icon'), ''),
  new VideoItem(2, $rawfile('video/thank_video.mp4'), '【智绘手语】第一集', CourseCategoryEnum.CourseTwo,
    $r('app.media.app_icon'), '智绘手语系列'),
  new VideoItem(3, $rawfile('video/we_video.mp4'), '【智绘手语】第二集', CourseCategoryEnum.CourseTwo,
    $r('app.media.app_icon'), ''),
]

class ItemVideoModel {
  //课程内视频列表
  list(CourseID: CourseCategoryEnum | null = null): VideoItem[] {
    return videos.filter(item => item.CourseID === CourseID);
  }
}


let itemVideoModel = new ItemVideoModel()

export default itemVideoModel as ItemVideoModel
