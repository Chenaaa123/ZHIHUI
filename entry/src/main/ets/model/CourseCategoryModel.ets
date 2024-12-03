//课程分类操作model
import CourseCategory from "../viewmodel/CourseCategory"


//枚举类型 课程名
enum CourseCategoryEnum{
  CourseOne,
  CourseTwo
}

//类型数组
let AllCategory = [
  new CourseCategory(0,'手语启航系列'),
  new CourseCategory(1,'智绘手语系列'),
]

export { AllCategory, CourseCategoryEnum };
