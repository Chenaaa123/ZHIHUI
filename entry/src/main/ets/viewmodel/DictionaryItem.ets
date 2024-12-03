//手语词汇

export default class DictionaryItem{
  // id
  "id" :number
  // 词汇名称
  "wordName": ResourceStr
  // 词汇拼音
  "spell":ResourceStr
  // 词汇图片
  "image":ResourceStr
  // 词汇分类id
  "categoryId":number
  // 词汇释义
  "detail":ResourceStr
  // 词汇动作描述
  "action":ResourceStr
  "word_video" :ResourceStr



  constructor(id:number, wordName:ResourceStr,spell:ResourceStr,
              image:ResourceStr,categoryId:number,
              detail:ResourceStr,action:ResourceStr,word_video :ResourceStr) {
    this.id = id
    this.wordName = wordName
    this.spell = spell
    this.image = image
    this.categoryId =categoryId
    this.detail = detail
    this.action = action
    this.word_video = word_video
  }
}