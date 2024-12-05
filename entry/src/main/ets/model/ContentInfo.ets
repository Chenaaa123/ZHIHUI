import { commonType } from '@kit.ArkData';

export class ContentInfo {
  mainTitle: string | undefined;
  textContent: string | undefined;
  imageUriArray: Array<ImageInfo> | undefined;
  isShowLocalInfo: boolean | undefined;
  isAddLocalInfo: boolean | undefined;
  selectLocalInfo: string | undefined;
  attachments: commonType.Assets | undefined;

  constructor(
    mainTitle: string | undefined,
    textContent: string | undefined,
    imageUriArray: Array<ImageInfo> | undefined,
    isShowLocalInfo: boolean | undefined,
    isAddLocalInfo: boolean | undefined,
    selectLocalInfo: string | undefined,
    attachments: commonType.Assets | undefined
  ) {
    this.mainTitle = mainTitle;
    this.textContent = textContent;
    this.imageUriArray = imageUriArray;
    this.isShowLocalInfo = isShowLocalInfo;
    this.isAddLocalInfo = isAddLocalInfo;
    this.selectLocalInfo = selectLocalInfo;
    this.attachments = attachments;
  }

  flatAssets(): object {
    let obj: object = this;
    if (!this.attachments) {
      return obj;
    }
    for (let i = 0; i < this.attachments.length; i++) {
      obj[`attachments${i}`] = this.attachments[i];
    }
    return obj;
  }
}


export interface ImageInfo {
  /**
   * image PixelMap.
   */
  imagePixelMap: PixelMap;

  /**
   * Image name.
   */
  imageName: string;
}
