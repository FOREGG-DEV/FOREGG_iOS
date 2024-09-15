//
//  HomeView.swift
//  hugg
//
//  Created by Donghan Kim on 7/8/24.
//

import SwiftUI

struct HomeView: View {
    // init viewmodel
    @StateObject var viewModel = HomeViewModel()

    init() {
        UITabBar.appearance().backgroundColor = .navbarBg
    }

    var body: some View {
        TabView(selection: $viewModel.currentTab) {
            TabViewContainer(title: "calendar")
                .tabItem {
                    BottomNavItem(title: "캘린더", image: "calendar", isSelected: viewModel.currentTab == .calendar)
                }.tag(HomeTab.calendar)

            TabViewContainer(title: "가계부")
                .tabItem {
                    BottomNavItem(title: "가계부", image: "savings", isSelected: viewModel.currentTab == .savings)
                }.tag(HomeTab.savings)

            TabViewContainer(title: "홈 화면")
                .tabItem {
                    BottomNavItem(title: "홈", image: "home", isSelected: viewModel.currentTab == .home)
                }.tag(HomeTab.home)

            InformationView()
                .tabItem {
                    BottomNavItem(title: "정보", image: "info", isSelected: viewModel.currentTab == .info)
                }.tag(HomeTab.info)

            TabViewContainer(title: "마이페이지")
                .tabItem {
                    BottomNavItem(title: "마이페이지", image: "mypage", isSelected: viewModel.currentTab == .mypage)
                }.tag(HomeTab.mypage)
        }
        .tint(.black80)
    }
}

#Preview {
    HomeView()
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
