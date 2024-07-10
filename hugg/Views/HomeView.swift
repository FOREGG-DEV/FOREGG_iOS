//
//  HomeView.swift
//  hugg
//
//  Created by Donghan Kim on 7/8/24.
//

import SwiftUI

enum HomeTab {
    case calendar, savings, home, info, mypage
}

struct HomeView: View {
    @State private var currentTab: HomeTab = .home

    init() {
        UITabBar.appearance().backgroundColor = .menubarBg
    }

    var body: some View {
        TabView(selection: $currentTab) {
            TabViewContainer(title: "calendar")
                .tabItem {
                    BottomNavItem(title: "캘린더", image: "calendar", isSelected: currentTab == .calendar)
                }.tag(HomeTab.calendar)

            TabViewContainer(title: "가계부")
                .tabItem {
                    BottomNavItem(title: "가계부", image: "savings", isSelected: currentTab == .savings)
                }.tag(HomeTab.savings)

            TabViewContainer(title: "홈 화면")
                .tabItem {
                    BottomNavItem(title: "홈", image: "home", isSelected: currentTab == .home)
                }.tag(HomeTab.home)

            TabViewContainer(title: "정보")
                .tabItem {
                    BottomNavItem(title: "정보", image: "info", isSelected: currentTab == .info)
                }.tag(HomeTab.info)

            TabViewContainer(title: "마이페이지")
                .tabItem {
                    BottomNavItem(title: "마이페이지", image: "mypage", isSelected: currentTab == .mypage)
                }.tag(HomeTab.mypage)
        }
        .tint(.black80)
    }
}

#Preview {
    HomeView()
}

struct BottomNavItem: View {
    let title: String
    let image: String
    let isSelected: Bool

    var body: some View {
        Label {
            Text(title)
                .font(.bottomNavTitle)

        } icon: {
            Image(isSelected ? image + "Fill" : image)
        }
    }
}

struct TabViewContainer: View {
    let title: String

    var body: some View {
        VStack {
            Text(title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.bg)
    }
}

// Custom TabView를 써야하는 건가..?
