
import SwiftUI

enum HomeTab {
    case calendar, savings, home, info, mypage
}

class HomeViewModel: ObservableObject {
    @Published var currentTab: HomeTab = .home
}
