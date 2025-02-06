import SwiftUI

// TODO: - What is UIColor and Color ?

struct MainScreen: View {
    // init viewmodel
    @EnvironmentObject var model: AppState

    init() {
        // Change default TabBar background color
        UITabBar.appearance().backgroundColor = .navbarBg
    }

    var body: some View {
        TabView(selection: $model.currentBottomNavTab) {
            HomeScreen()
                .tabItem {
                    BottomNavItem(title: "홈", image: "home", isSelected: model.currentBottomNavTab == BottomNavigationTab.home)
                }.tag(BottomNavigationTab.home)

            TabViewContainer(title: "calendar")
                .tabItem {
                    BottomNavItem(title: "캘린더", image: "calendar", isSelected: model.currentBottomNavTab == BottomNavigationTab.calendar)
                }.tag(BottomNavigationTab.calendar)

            DailyHugView()
                .tabItem {
                    BottomNavItem(title: "데일리 허그", image: "info", isSelected: model.currentBottomNavTab == BottomNavigationTab.daily)
                }.tag(BottomNavigationTab.daily)

            LedgerScreen()
                .tabItem {
                    BottomNavItem(title: "가계부", image: "savings", isSelected: model.currentBottomNavTab == BottomNavigationTab.ledger)
                }.tag(BottomNavigationTab.ledger)

            MyPageScreen()
                .tabItem {
                    BottomNavItem(title: "마이페이지", image: "mypage", isSelected: model.currentBottomNavTab == BottomNavigationTab.mypage)
                }.tag(BottomNavigationTab.mypage)
        }
        .tint(.black80)
    }
}

// MARK: - Bottom Navigation Item

/// Main Screen Bottom Navigation Item
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

// MARK: - 임시 TabView

///
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

#Preview {
    PreviewContainer {
        MainScreen()
            .environmentObject(AppState())
    }
}
