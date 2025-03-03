import KakaoSDKAuth
import KakaoSDKUser
import SwiftUI

struct OnboardingScreen: View {
    //    init viewModel instance
    @StateObject private var state = OnboardingState()

    var body: some View {
        VStack(spacing: 0) {
            OnboardingAppBar(state: state)
            // TODO: TabView Size change(depending on device size)

            TabView(selection: $state.currentStep) {
                ForEach(0 ..< state.datas.count, id: \.self) { idx in
                    OnboardingContent(data: state.datas[idx]).tag(idx)
                        .gesture(DragGesture(minimumDistance: 10).onEnded { endedGesture in
                            // 오른쪽으로 스와이프
                            if endedGesture.location.x - endedGesture.startLocation.x > 0 {
                                state.decreaseStep()
                            } else {
                                // 왼쪽으로 스와이프
                                state.increaseStep()
                            }
                        })
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            // MARK: Custom tabview indicator using HStack

            HStack {
                ForEach(0 ..< state.datas.count, id: \.self) { index in
                    Rectangle()
                        .frame(width: index == state.currentStep ? 24 : 8, height: 8)
                        .foregroundColor(index == state.currentStep ? .main : .black30)
                        .cornerRadius(5)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 30).fill(Color.clear))
            .frame(width: 60)
            .allowsTightening(false)
            .padding(.bottom, 32)

            if state.currentStep == state.datas.count - 1 {
                VStack {
                    // kakao login button
                    Image(.kakaoLogin)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 52)
                        .padding(.horizontal, 16)
                        .onTapGesture {
                            handleKakaoLogin()
                        }

                    // apple login button
                    Image(.appleLogin)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 52)
                        .padding(.horizontal, 16)
                        .onTapGesture {
                            handleAppleLogin()
                        }
                }
            } else {
                VStack {
                    HGBorderedButton(label: "다음", isEnabled: true, action: state.increaseStep)
                        .padding(.horizontal, 16)
                }
                .frame(height: 105)
            }
            Spacer()
                .frame(height: 60)
        }
        .background(.mainBg)
    }
}

extension OnboardingScreen {
    private func loginProcess(_ token: String) {
        // maybe get the kakao jwt here
        print("kakao token is \(token)")
        // save to UserDefaults
    }

    // how can i do unit test this ?
    private func handleKakaoLogin() {
        // 카카오톡으로 로그인 사용 가능한지 체크
        // 불가능한 경우 카카오톡 웹으로 띄우기
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                if let error = error {
                    print(error)
                    // show error dialog
                } else {
                    // 로그인 성공
                    print("kakao login is success")
                    let result = oauthToken?.accessToken
                    print(result ?? "No token found")
                    // set token to userDefaults?

                    // POST: auth/login
                    loginProcess(result ?? "no token founded")
                }
            }
        } else {
            print("cannot use kakao login")
            UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                if let error = error {
                    print(error)
                    // show error dialog
                } else {
                    // 로그인 성공
                    print("kakao login is success")
                    let result = oauthToken?.accessToken
                    print(result ?? "No token found")
                    // set token to userDefaults?

                    // POST: auth/login
                    loginProcess(result ?? "no token founded")
                }
            }
        }
    }

    // TODO: - Implement Apple login
    private func handleAppleLogin() {}
}

#Preview {
    OnboardingScreen()
}
