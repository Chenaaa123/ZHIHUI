//课程分类类型

export default class CourseCategory{
  //id
  "id" : number
  //分类名称
  "CourseCategoryName":string



  constructor(id : number, CourseCategoryName : string) {
    this.id = id
    this.CourseCategoryName = CourseCategoryName
  }

  public getName(): string {
    return this.CourseCategoryName;
  }
}