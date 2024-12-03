// 首页新闻

export default class newsItem{
  "newId" : number
  "newTitle" : string
  "content" : string
  "new_image" :  ResourceStr
  "new_date" : string

  constructor(newId : number,newTitle : string,content:string,new_image: ResourceStr,new_date:string) {
    this.content = content
    this.newTitle =newTitle
    this.new_image = new_image
    this.newId = newId
    this.new_date = new_date
  }
}

