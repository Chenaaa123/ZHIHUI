import { http } from '@kit.NetworkKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { JSON } from '@kit.ArkTS';

export class NetWorkService {
  baseUrl: string;
  TAG = 'NetWork'

  constructor(baseUrl: string) {
    this.baseUrl = baseUrl;
  }

  doGet(): void {

    let httpRequest = http.createHttp()

    httpRequest.on('headerReceive', (header) => {
      console.info( 'header：' + JSON.stringify(header));
    });

    httpRequest.request(this.baseUrl, {
      method: http.RequestMethod.GET,
      header: {
        'Content-Type': 'application/json'
      },
      usingCache: true, // 使用缓存
      connectTimeout: 60000, // 60s
    }, (err: BusinessError, data: http.HttpResponse) => {
      if (!err) {
        console.info("服务端返回...."+(data.responseCode));
        console.info("result is "+data.result);
        httpRequest.destroy() // 调用一次http请求完成之后，主动销毁
      } else {
        console.error('error' + JSON.stringify(err));
        //
        httpRequest.off('headerReceive'); // on 开始注册 off 停止注册
        httpRequest.destroy();
      }
    });
  }
}
