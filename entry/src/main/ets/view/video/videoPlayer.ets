@Component
export default struct videoPlay{
  // private controller:VideoController | undefined;
  private previewUris: Resource = $r ('app.media.gaoxing');
  // private innerResource: Resource = $rawfile('aaa.mp4');
  build(){
    Column() {
      Video({
        // src: this.innerResource,
        previewUri: this.previewUris,
        // controller: this.controller
      })
    }
  }
}