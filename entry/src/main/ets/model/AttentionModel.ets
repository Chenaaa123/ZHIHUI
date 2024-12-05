import AttentionItem from '../viewmodel/AttentionItem';

class Blogger {
  private bloggers: AttentionItem[];

  constructor() {
    this.bloggers = [
      new AttentionItem(0, '指麾', $r('app.media.app_icon'), '10万', '指麾官方',
        '致力于通过宣传通用手语和保护自然手语来实现服务听障人士、提高社会对听障人群关注度。'),
      new AttentionItem(1, '景德镇市残疾人联合会', $r('app.media.DPF'), '20万', '景德镇残联',
        '为群众打造了解景德镇残疾人事业的平台和窗口'),
      new AttentionItem(2, '中国普法', $r('app.media.law_china'), '30万', '中华人民共和国司法部',
        '以权威声音、主流价值、法治特色、清新表达为宗旨，坚持正确舆论导向，坚持真实性、原创性、互动性、服务性相统一，最大限度地传播和增加法治“正能量”。'),
      new AttentionItem(3, '中国残疾人福利基金会', $r('app.media.DPF_foundation'), '20万', '中国残疾人福利基金会',
        '基金会的宗旨是弘扬人道，奉献爱心，全心全意为残疾人服务。'),
      new AttentionItem(4, '景德镇政法', $r('app.media.jdz_politics_and_law'), '20万', '景德镇市委政法委员会',
        '汇聚法治力量 讲好平安故事 擦亮忠诚底色'),
      new AttentionItem(5, '心理与健康杂志', $r('app.media.mental_health'), '10万', '杂志社',
        '服务于精神卫生从业者、教师、心理求助者及家属等人群'),
      new AttentionItem(6, '残障之声', $r('app.media.voice_disabled'), '5万', '优质博主',
        '残障有不一样的阴霾但是有一样的阳光，有不一样的泪水但是有一样的笑脸，有不一样的经历但是有一样的权利'),
      new AttentionItem(7, '有人', $r('app.media.have_people'), '7万', '上海有人公益基金会',
        '致力于推动中国残障行业的可持续发展，在中国残障事业转型期以社群培育者、支持者和领军者为己任。'),
    ]
  }

  public getBlogger(): AttentionItem[] {
    return this.bloggers;
  }
}

export default Blogger