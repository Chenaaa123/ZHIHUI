
//首页关注
export default class AttentionItem{
  "bloggerId" : number   //ID
  "bloggerName" : string  //博主名称
  "bloggerImage" :  ResourceStr  //博主头像
  "fans" : string   //粉丝
  "bloggerCategory" : string   //博主类型
  "signature" : string   //个性签名

  constructor(bloggerId : number,bloggerName:string, bloggerImage: ResourceStr,fans:string,bloggerCategory:string,signature:string) {
    this.bloggerId = bloggerId
    this.bloggerName =bloggerName
    this.bloggerImage = bloggerImage
    this.fans = fans
    this.bloggerCategory = bloggerCategory
    this.signature = signature
  }
}