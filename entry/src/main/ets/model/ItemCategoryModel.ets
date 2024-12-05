//词汇分类操作model
import ItemCategory from '../viewmodel/ItemCategory'

//枚举类型
enum ItemCategoryEnum {
  Universal_sign_language,
  Local_sign_language
}

//类型数组
let AllCategory = [
  new ItemCategory(0, $r('app.string.Universal_sign_language')),
  new ItemCategory(1, $r('app.string.Local_sign_language')),
]

export { AllCategory, ItemCategoryEnum }