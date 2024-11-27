class GlobalState {
  private static instance: GlobalState;
  public count: number;

  private constructor() {
    this.count = 0; // 初始化计数值
  }

  public static getInstance(): GlobalState {
    if (!GlobalState.instance) {
      GlobalState.instance = new GlobalState();
    }
    return GlobalState.instance;
  }
}
let globalState = GlobalState.getInstance()
export default globalState