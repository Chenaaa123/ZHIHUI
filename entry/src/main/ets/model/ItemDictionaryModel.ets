//词汇详情操作model
import DictionaryItem from '../viewmodel/DictionaryItem'
import { ItemCategoryEnum } from './ItemCategoryModel'

const words: DictionaryItem[] = [
  new DictionaryItem(0, '高兴', 'gaoxing', $r('app.media.gaoxing'), ItemCategoryEnum.Universal_sign_language, '高兴', '动作'),
  new DictionaryItem(1, '你好', 'nihao', $r('app.media.gaoxing'), ItemCategoryEnum.Universal_sign_language, '高兴', '动作'),
  new DictionaryItem(2, '安排', 'gaoxing', $r('app.media.anpai'), ItemCategoryEnum.Universal_sign_language, '高兴', '动作'),
  new DictionaryItem(3, '爸爸', 'gaoxing', $r('app.media.gaoxing'), ItemCategoryEnum.Local_sign_language, '高兴', '动作'),
  new DictionaryItem(4, '早上好', 'gaoxing', $r('app.media.gaoxing'), ItemCategoryEnum.Local_sign_language, '高兴', '动作'),
  new DictionaryItem(5, '晚上好', 'gaoxing', $r('app.media.gaoxing'), ItemCategoryEnum.Local_sign_language, '高兴', '动作'),
]


// interface GeneratedTypeLiteralInterface_1 {
//   items: DictionaryItem[];
//   count: number;
// }

class ItemDictionaryModel {
  //词汇列表
  list(categoryId: ItemCategoryEnum | null = null): DictionaryItem[] {
    if (categoryId === null) {
      return words; // 返回所有项
    } else {
      return words.filter(item => item.categoryId === categoryId);
    }
  }
  //查询搜索
  findByWordName(wordName: string): DictionaryItem | undefined {
    return words.find(item => item.wordName === wordName);
  }
  //记录收藏
  // isCollected(wordName: string): GeneratedTypeLiteralInterface_1 {
    // const collectedItems = words.filter(item => item.collected === true);
    // return { items: collectedItems, count: collectedItems.length };
  // }
}



let itemDictionaryModel = new ItemDictionaryModel()

export default itemDictionaryModel as ItemDictionaryModel