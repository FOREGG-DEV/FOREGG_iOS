// 개발을 위한 변수 저장
enum DevMode: Equatable {
    case dev
    case prod
    case ui(Route)
}

let devMode = DevMode.ui(.ledgerForm)
