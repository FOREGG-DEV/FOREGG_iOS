//
//  ContentView.swift
//  hugg
//
//  Created by Donghan Kim on 7/4/24.
//

import SwiftUI

struct ContentView: View {
    // UserDefaults -> check
    @State private var hasSeenOnboarding = UserDefaults.standard.bool(forKey: "hasSeenOnboarding")

    var body: some View {
        Group {
            if hasSeenOnboarding {
                MainView() // 메인 화면
            } else {
                OnboardingView()
                    .onDisappear {
                        self.hasSeenOnboarding = true
                    }
            }
        }
    }
}

struct MainView: View {
    var body: some View {
        Text("This is the main view")
            .font(.largeTitle)
            .padding()
    }
}

#Preview {
    ContentView()
}
