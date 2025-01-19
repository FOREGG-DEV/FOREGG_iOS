
import SwiftUI

enum HomeTab {
    case calendar, savings, home, daily, mypage
}

class MainViewModel: ObservableObject {
    @Published var currentTab: HomeTab = .home
}
