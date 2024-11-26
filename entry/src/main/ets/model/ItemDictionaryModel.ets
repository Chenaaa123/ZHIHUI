//词汇详情操作model
import DictionaryItem from '../viewmodel/DictionaryItem'
import { ItemCategoryEnum } from './ItemCategoryModel'

const words: DictionaryItem[] = [
  new DictionaryItem(0, '高兴', 'gaoxing', $r('app.media.gaoxing'), ItemCategoryEnum.Universal_sign_language, '高兴', '动作'),
  new DictionaryItem(1, '你好', 'nihao', $r('app.media.gaoxing'), ItemCategoryEnum.Universal_sign_language, '高兴', '动作'),
  new DictionaryItem(2, '安排', 'gaoxing', $r('app.media.anpai'), ItemCategoryEnum.Universal_sign_language, '高兴', '动作'),
  new DictionaryItem(3, '高兴', 'gaoxing', $r('app.media.gaoxing'), ItemCategoryEnum.Local_sign_language, '高兴', '动作'),
  new DictionaryItem(4, '高兴', 'gaoxing', $r('app.media.gaoxing'), ItemCategoryEnum.Local_sign_language, '高兴', '动作'),
  new DictionaryItem(5, '高兴', 'gaoxing', $r('app.media.gaoxing'), ItemCategoryEnum.Local_sign_language, '高兴', '动作'),
]


class ItemDictionaryModel {
  // list(iscategory : boolean = true): DictionaryItem[] {
  //   return iscategory ? words.filter(item => item.categoryId === ItemCategoryEnum.Universal_sign_language) : words;
  // }

  list(categoryId: ItemCategoryEnum | null = null): DictionaryItem[] {
    if (categoryId === null) {
      return words; // 返回所有项
    } else {
      return words.filter(item => item.categoryId === categoryId);
    }
  }

}

let itemDictionaryModel = new ItemDictionaryModel()

export default itemDictionaryModel as ItemDictionaryModel