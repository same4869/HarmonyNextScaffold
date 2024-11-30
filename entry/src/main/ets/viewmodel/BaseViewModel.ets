export type StateCallback = (state: string) => void

export class BaseViewModel {
  private stateCallback?: StateCallback

  observeState(stateCallback: StateCallback) {
    this.stateCallback = stateCallback
  }

  dispatchState(state: string) {
    this.stateCallback?.(state)
  }

}