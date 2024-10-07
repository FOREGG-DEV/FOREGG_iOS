//
//  OnboardingView.swift
//  hugg
//
//  Created by Donghan Kim on 7/4/24.
//

import SwiftUI

struct OnboardingView: View {
    //    init viewModel instance
    @StateObject private var viewModel = OnboardingViewModel()

    var body: some View {
        VStack(spacing: 0) {
            OnboardingAppBar(viewModel: viewModel)
            // TODO: TabView Size change(depending on device size)
            // check fastcampus project

            TabView(selection: $viewModel.currentStep) {
                ForEach(0 ..< viewModel.datas.count, id: \.self) { idx in
                    OnboardingContent(data: viewModel.datas[idx]).tag(idx)
                        .gesture(DragGesture(minimumDistance: 10).onEnded { endedGesture in
                            if endedGesture.location.x - endedGesture.startLocation.x > 0 {
                                viewModel.decreaseStep()
                            } else {
                                // right to left
                                viewModel.increaseStep()
                            }
                        })
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            // MARK: Custom tabview indicator using HStack

            HStack {
                ForEach(0 ..< viewModel.datas.count, id: \.self) { index in
                    Rectangle()
                        .frame(width: index == viewModel.currentStep ? 24 : 8, height: 8)
                        .foregroundColor(index == viewModel.currentStep ? .main : .black30)
                        .cornerRadius(5)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 30).fill(Color.clear))
            .frame(width: 60)
            .allowsTightening(false)
            .padding(.bottom, 32)

            // TODO: kakao button

            if viewModel.currentStep == 3 {
                DummyButton()
                    .padding(.horizontal, 16)
            } else {
                BorderedButton(label: "다음", action: viewModel.increaseStep)
                    .padding(.horizontal, 16)
            }
            Spacer()
                .frame(height: 60)
        }
        .background(.mainBg)
    }
}

private struct DummyButton: View {
    fileprivate var body: some View {
        Button(action: {}) {
            Text("카카오로 로그인")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
        }
        .background(.yellow)
        .padding(.horizontal, 16)
    }
}

#Preview {
    OnboardingView()
}
