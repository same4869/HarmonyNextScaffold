
import { BaseWebComponent } from '../components/web/BaseWebComponent'

@Component
export struct FinancePage {
  build() {
    Stack(){
      BaseWebComponent({src:"https://www.baidu.com"})
    }
    .height("100%").width("100%")
  }
}