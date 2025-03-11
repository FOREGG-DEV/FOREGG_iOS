import KakaoSDKAuth
import KakaoSDKUser
import SwiftUI

struct OnboardingScreen: View {
    //    init viewModel instance
    @StateObject private var state = OnboardingState()
    @EnvironmentObject private var appState: AppState
    @State private var showPopup: Bool = false
    private let client = LoginHTTPClient()

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
        .popup(isPresented: $showPopup) {
            ErrorPopup(onConfirm: {
                showPopup.toggle()
            })
        } customize: {
            $0
                .appearFrom(.centerScale)
                .position(.center)
                .closeOnTapOutside(true)
                .closeOnTap(false)
                .backgroundColor(.dimBg)
        }
    }
}

extension OnboardingScreen {
    private func loginProcess(_ token: String) async {
        print("kakao token is \(token)")

        let resource = Resource(
            url: Constants.Urls.login,
            method: .post(nil),
            modelType: ApiResponse<UserResponseDTO>.self
        )

        do {
            let response = try await client.load(resource, token: token)
            if response.isSuccess, let userData = response.data {
                // save token to UserDefaults
                appState.routes.append(.mainScreen) // ✅ 로그인 성공 → 메인 화면 이동
            }
        } catch let NetworkError.serverError(error as ApiResponse<UserResponseDTO>) {
            if error.code == "USER4002" {
                print("🚨 회원가입이 필요한 사용자")
                appState.routes.append(.register)
            }
        } catch {
            print("❌ 예상치 못한 로그인 실패")
            showPopup.toggle() // 에러 팝업 표시
        }
    }

    // how can i do unit test this ?
    private func handleKakaoLogin() {
        // 카카오톡으로 로그인 사용 가능한지 체크
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                if let error = error {
                    print(error.localizedDescription)
                    showPopup.toggle()
                } else {
                    // 로그인 성공
                    let result = oauthToken?.accessToken

                    Task {
                        await loginProcess(result ?? "no token")
                    }
                }
            }
            // 불가능한 경우 카카오톡 웹으로 띄우기
        } else {
            print("cannot use kakao login")
            UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                if let error = error {
                    showPopup.toggle()
                } else {
                    // 로그인 성공
                    print("kakao login is success")
                    let result = oauthToken?.accessToken
                    print(result ?? "No token found")
                    // set token to userDefaults?

                    // POST: auth/login
                    Task {
                        do {
                            try await loginProcess(result ?? "no token")
                        } catch {
                            print(error.localizedDescription)
                            showPopup.toggle()
                        }
                    }
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
