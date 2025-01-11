import SwiftUI

struct MainScreen: View {
    // init viewmodel
    @StateObject var vm = MainViewModel()

    init() {
        UITabBar.appearance().backgroundColor = .navbarBg
    }

    var body: some View {
        TabView(selection: $vm.currentTab) {
            HomeScreen()
                .tabItem {
                    BottomNavItem(title: "홈", image: "home", isSelected: vm.currentTab == .home)
                }.tag(HomeTab.home)

            TabViewContainer(title: "calendar")
                .tabItem {
                    BottomNavItem(title: "캘린더", image: "calendar", isSelected: vm.currentTab == .calendar)
                }.tag(HomeTab.calendar)

            DailyHugView()
                .tabItem {
                    BottomNavItem(title: "데일리 허그", image: "info", isSelected: vm.currentTab == .daily)
                }.tag(HomeTab.daily)

            TabViewContainer(title: "가계부")
                .tabItem {
                    BottomNavItem(title: "가계부", image: "savings", isSelected: vm.currentTab == .savings)
                }.tag(HomeTab.savings)

            MyPageScreen()
                .tabItem {
                    BottomNavItem(title: "마이페이지", image: "mypage", isSelected: vm.currentTab == .mypage)
                }.tag(HomeTab.mypage)
        }
        .tint(.black80)
    }
}

#Preview {
    MainScreen()
}

private struct BottomNavItem: View {
    let title: String
    let image: String
    let isSelected: Bool

    fileprivate var body: some View {
        Label {
            Text(title)
                .font(.bottomNavTitle)

        } icon: {
            Image(isSelected ? image + "Fill" : image)
        }
    }
}

private struct TabViewContainer: View {
    let title: String

    fileprivate var body: some View {
        VStack {
            Text(title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.mainBg)
    }
}

// Custom TabView를 써야하는 건가..?
