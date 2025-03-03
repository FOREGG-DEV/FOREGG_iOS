import SwiftUI

// TODO: - What is UIColor and Color ?

struct MainScreen: View {
    // init viewmodel
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var myPageModel: MyPageModel
    @State var viewStatus: ViewStatus = .loading

    init() {
        // Change default TabBar background color
        UITabBar.appearance().backgroundColor = .navbarBg
    }

    var body: some View {
        VStack {
            switch self.viewStatus {
            case .loading:
                VStack {
                    Spacer()
                    HGProgressView()
                    Spacer()
                }
                .background(Constants.Colors.backgroundMain)
                .frame(maxWidth: .infinity)
            case .success:
                TabView(selection: self.$appState.currentBottomNavTab) {
                    HomeScreen()
                        .tabItem {
                            BottomNavItem(title: "홈", image: "home", isSelected: self.appState.currentBottomNavTab == BottomNavigationTab.home)
                        }.tag(BottomNavigationTab.home)

                    TabViewContainer(title: "calendar")
                        .tabItem {
                            BottomNavItem(title: "캘린더", image: "calendar", isSelected: self.appState.currentBottomNavTab == BottomNavigationTab.calendar)
                        }.tag(BottomNavigationTab.calendar)

                    DailyHugView()
                        .tabItem {
                            BottomNavItem(title: "데일리 허그", image: "daily", isSelected: self.appState.currentBottomNavTab == BottomNavigationTab.daily)
                        }.tag(BottomNavigationTab.daily)

                    LedgerScreen()
                        .tabItem {
                            BottomNavItem(title: "가계부", image: "ledger", isSelected: self.appState.currentBottomNavTab == BottomNavigationTab.ledger)
                        }.tag(BottomNavigationTab.ledger)

                    MyPageScreen()
                        .tabItem {
                            BottomNavItem(title: "마이페이지", image: "myPage", isSelected: self.appState.currentBottomNavTab == BottomNavigationTab.mypage)
                        }.tag(BottomNavigationTab.mypage)
                }
                .tint(.black80)
            case .failure:
                VStack {
                    HGErrorView(onTapRefresh: {
                        Task {
                            await initApplication()
                        }
                    })
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Constants.Colors.backgroundMain)
        .task {
            if self.myPageModel.myPage == nil {
                await initApplication()
            }
        }
    }
}

extension MainScreen {
    // application 실행 시 초기화해야하는 데이터. fcm 토큰도 여기서 요청해야할까?
    // myPageModel 초기화 실행 -> myPage에서는 따로 처리 안해도 될 것 같음
    func initApplication() async {
        do {
            self.viewStatus = .loading
            try await self.myPageModel.populateMyPage()
            self.viewStatus = .success
        } catch {
            self.viewStatus = .failure(error.localizedDescription)
        }
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
            Text(self.title)
                .font(.bottomNavTitle)

        } icon: {
            Image(self.isSelected ? self.image + "Fill" : self.image)
        }
    }
}

// MARK: - 임시 TabView

///
private struct TabViewContainer: View {
    let title: String

    fileprivate var body: some View {
        VStack {
            Text(self.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.mainBg)
    }
}

#Preview {
    PreviewContainer {
        MainScreen()
            .environmentObject(MyPageModel())
            .environmentObject(HomeScreenModel())
    }
}
