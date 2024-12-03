//词汇详情操作model
import DictionaryItem from '../viewmodel/DictionaryItem'
import { ItemCategoryEnum } from './ItemCategoryModel'

const words: DictionaryItem[] = [
  new DictionaryItem(0, '高兴', 'gāo xìng', $r('app.media.gaoxing'), ItemCategoryEnum.Universal_sign_language, '表示愉快而兴奋。', '双手横伸，掌心向上，在胸前同时向上移动两下，面露笑容。',$rawfile('video/happy_video.mp4')),
  new DictionaryItem(1, '感谢', 'xiè xie', $r("app.media.thank"), ItemCategoryEnum.Local_sign_language, '对别人的好意表示感谢。', '一手(或双手)伸拇指，向前弯动两下，面带笑容。',$rawfile('video/thank_video.mp4')),
  new DictionaryItem(2, '我们', 'wǒ men', $r("app.media.we"), ItemCategoryEnum.Universal_sign_language, '人称代词。称包括自己在内的若干人。', '(一)一手伸食指，指一下自己(或一手手掌拍一下胸部)。(二)一手横伸，掌心向下，顺时针平行转动半圈。',$rawfile('video/we_video.mp4')),
  new DictionaryItem(3, '抱歉', 'bào qiàn', $r("app.media.sorry"), ItemCategoryEnum.Local_sign_language, '心中不安，觉得对不起人。', '一手五指并拢，贴于额际，如军人行军礼状，然后伸小指，向胸部点几下，表示向人道歉并自责。',$rawfile('video/sorry_video.mp4')),
  new DictionaryItem(4, '安静', 'ān jìng', $r('app.media.anjing'), ItemCategoryEnum.Universal_sign_language, '①没有声息；没有喧哗吵闹声②平静；安稳。', '(一)一手横伸，掌心向下，自胸部向下一按。(二)双手五指微曲，指尖朝上，边向下微移边搬合，面露舒缓的表情。',$rawfile('video/happy_video.mp4')),
  new DictionaryItem(5, '安排', 'ān pái', $r('app.media.anpai'), ItemCategoryEnum.Local_sign_language, '就某一内容单一的活动（工作）所制订的临时性的、时间较短的而且又比较具体、切实的计划。', '(一)一手横伸，掌心向下，自胸部向下一按。(二)双手直立，五指张开，一前一后排成一列.',$rawfile('video/happy_video.mp4')),
  new DictionaryItem(6, '爱人', 'ài ren', $r('app.media.airen'), ItemCategoryEnum.Universal_sign_language, '指恋爱中男女的一方。', '双手伸拇指，虎口朝上，置于身体一侧，指面相对，弯动一下(可根据语境决定所指的对象，如男人指一下女人或先指自己，再在身体一侧打此手势表示的是妻子:反之，表示的是丈夫)。',$rawfile('video/happy_video.mp4')),
  new DictionaryItem(7, '早上①', 'zǎo shàng', $r('app.media.morning1'), ItemCategoryEnum.Local_sign_language, '指日出至日出后四小时的时刻（一般指辰时）。', '手五指撮合，边向上做弧形移动边张开',$rawfile('video/happy_video.mp4')),
  new DictionaryItem(8, '早上②', 'zǎo shàng', $r('app.media.morning2'), ItemCategoryEnum.Universal_sign_language, '指日出至日出后四小时的时刻（一般指辰时）。', '一手横立，食、中、无名、小指并拢，在部从左向右摸。',$rawfile('video/happy_video.mp4')),

]


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

}



let itemDictionaryModel = new ItemDictionaryModel()

export default itemDictionaryModel as ItemDictionaryModel