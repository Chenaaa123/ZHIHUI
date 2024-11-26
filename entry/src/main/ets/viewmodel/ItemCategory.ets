//词汇分类类型

export default class ItemCategory{
  //id
  "id" : number
  //分类名称
  "categoryName":ResourceStr

  constructor(id : number, categoryName : ResourceStr) {
    this.id = id
    this.categoryName = categoryName
  }
}