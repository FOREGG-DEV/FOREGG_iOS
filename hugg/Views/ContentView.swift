//
//  ContentView.swift
//  hugg
//
//  Created by Donghan Kim on 7/4/24.
//

import SwiftUI

struct MainView: View {
    // UserDefaults -> check
    @State private var hasSeenOnboarding = UserDefaults.standard.bool(forKey: "hasSeenOnboarding")
    // show splash
    @State private var showMainView = false

    var body: some View {
        ZStack {
            if showMainView {
                Group {
                    if hasSeenOnboarding {
                        MainScreen() // 메인 화면
                    } else {
                        OnboardingScreen()
                            .onDisappear {
                                self.hasSeenOnboarding = true
                            }
                    }
                }

            } else {
                SplashScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                showMainView = true
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    MainView()
}
