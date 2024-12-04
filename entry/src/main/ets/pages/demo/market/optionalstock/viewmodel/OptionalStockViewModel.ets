export class OptionalStockViewModel {
  /**
   * 自选股首页列表，模拟数据
   */
  opTestDataList: OpListDataBean[] = [
    { stockCode: "0010", stockName: "元素1", newPrice: "1.54", priceRange: "+0.65%" },
    { stockCode: "0519", stockName: "元素2", newPrice: "1692.33", priceRange: "-1.29%" },
    { stockCode: "0007", stockName: "元素3", newPrice: "18.33", priceRange: "-0.29%" },
    { stockCode: "0010", stockName: "元素4", newPrice: "1.54", priceRange: "+0.65%" },
    { stockCode: "0519", stockName: "元素5", newPrice: "1692.33", priceRange: "-1.29%" },
    { stockCode: "0007", stockName: "元素6", newPrice: "18.33", priceRange: "-0.29%" },
    { stockCode: "0010", stockName: "元素7", newPrice: "1.54", priceRange: "+0.65%" },
    { stockCode: "0519", stockName: "元素8", newPrice: "1692.33", priceRange: "-1.29%" },
    { stockCode: "0007", stockName: "元素9", newPrice: "18.33", priceRange: "-0.29%" },
    { stockCode: "0010", stockName: "元素10", newPrice: "1.54", priceRange: "+0.65%" },
    { stockCode: "0519", stockName: "元素11", newPrice: "1692.33", priceRange: "-1.29%" },
    { stockCode: "0007", stockName: "元素12", newPrice: "18.33", priceRange: "-0.29%" },
    { stockCode: "0010", stockName: "元素13", newPrice: "1.54", priceRange: "+0.65%" },
    { stockCode: "0519", stockName: "元素14", newPrice: "1692.33", priceRange: "-1.29%" },
    { stockCode: "0007", stockName: "元素15", newPrice: "18.33", priceRange: "-0.29%" },
    { stockCode: "0010", stockName: "元素16", newPrice: "1.54", priceRange: "+0.65%" },
    { stockCode: "0519", stockName: "元素17", newPrice: "1692.33", priceRange: "-1.29%" },
    { stockCode: "0007", stockName: "元素18", newPrice: "18.33", priceRange: "-0.29%" },
    { stockCode: "0010", stockName: "元素19", newPrice: "1.54", priceRange: "+0.65%" },
    { stockCode: "0519", stockName: "元素20", newPrice: "1692.33", priceRange: "-1.29%" },
    { stockCode: "0007", stockName: "元素21", newPrice: "18.33", priceRange: "-0.29%" },
  ]
}

export class OpListDataBean {
  stockCode: string = ""
  stockName: string = ""
  newPrice: string = ""
  priceRange: string = ""
}