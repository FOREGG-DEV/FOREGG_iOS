//
//  HomeViewModel.swift
//  hugg
//
//  Created by Donghan Kim on 7/19/24.
//

import SwiftUI

enum HomeTab {
    case calendar, savings, home, info, mypage
}

class HomeViewModel: ObservableObject {
    @Published var currentTab: HomeTab = .home
}
