//视频
export default class VideoItem {
  "id": number
  "video": Resource
  "videoName": string
  "CourseID": number
  "course_image": ResourceStr
  "CourseCategoryName": string | null

  constructor(id: number, video: Resource, videoName: string, CourseID: number, course_image: ResourceStr,
    CourseCategoryName: string) {
    this.id = id
    this.video = video
    this.videoName = videoName
    this.CourseID = CourseID
    this.course_image = course_image
    this.CourseCategoryName = CourseCategoryName
  }
}