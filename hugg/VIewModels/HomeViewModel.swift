
import SwiftUI

enum HomeTab {
    case calendar, savings, home, daily, mypage
}

class HomeViewModel: ObservableObject {
    @Published var currentTab: HomeTab = .home
}
