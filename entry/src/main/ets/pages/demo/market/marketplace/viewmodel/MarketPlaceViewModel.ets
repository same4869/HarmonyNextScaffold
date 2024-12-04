export class MarketPlaceViewModel {
  /**
   * 市场页面所有tab
   */
  marketTabList: MarketTabBean[] = [
    {
      name: "tab标题1",
      value: 10
    },
    {
      name: "tab标题2",
      value: 20
    },
    {
      name: "tab标题3",
      value: 30
    },
    {
      name: "tab标题4",
      value: 40
    },
    {
      name: "tab标题5",
      value: 50
    },
    {
      name: "tab标题6",
      value: 60
    },
    {
      name: "tab标题7",
      value: 70
    },
    {
      name: "tab标题8",
      value: 80
    }
  ]
}

export class MarketTabBean {
  name: string = ""
  value: number = 0
}