/**
 @author: XWANG
 @date: 2024/1/11
 @description: 首页
 */
import { BaseWebComponent } from '../components/web/BaseWebComponent'

@Component
export struct HomePage {
  build() {
    Stack() {
      BaseWebComponent({ src: $rawfile('JSBridgeUnitTest.html') })
    }.height("100%").width("100%")
  }
}