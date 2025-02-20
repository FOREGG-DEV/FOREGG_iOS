import SwiftUI

private let OFFICAL_EMAIL = "for.egg0302@gmail.com"

struct MyPageQuestionScreen: View {
    @EnvironmentObject var appState: AppState
    @State var showToast: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            AppBar(title: "문의사항", onBack: {
                // popLast -> route return == _ var로 사용 안함 처리
                _ = appState.routes.popLast()
            })

            Spacer()
                .frame(height: 24)

            HeaderText(label: "Hugg 카카오톡 플러스 채널")
            Image(.kakaoChannel)
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 16)

            Spacer()
                .frame(height: 24)

            HeaderText(label: "Hugg 공식 메일")

            HStack(spacing: 0) {
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 8.0, bottomLeading: 8.0, bottomTrailing: 0.0, topTrailing: 0.0))
                        .fill(.white)
                    Text(OFFICAL_EMAIL)
                        .font(.h3)
                }
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0.0, bottomLeading: 0.0, bottomTrailing: 8.0, topTrailing: 8.0))
                        .fill(.main)
                        .frame(width: 48, height: 48)
                    Image(systemName: "square.on.square")
                        .foregroundStyle(.white)
                        .frame(width: 20, height: 20)
                }
            }
            .frame(height: 48)
            .padding(.horizontal, 16.0)
            .onTapGesture {
                Task {
                    try await codeToClipboard()
                }
            }

            if showToast {
                HGBlackToast(label: "클립보드에 메일주소가 복사되었어요!")
            }

            Spacer()
        }
        .background(Constants.Colors.backgroundMain)
    }
}

extension MyPageQuestionScreen {
    func codeToClipboard() async throws {
        withAnimation {
            showToast = true
        }

        let pasteboard = UIPasteboard.general
        // hugg 공식 구글 계정
        pasteboard.string = OFFICAL_EMAIL

        try await Task.sleep(for: .seconds(2))

        withAnimation {
            showToast = false
        }
    }
}

private struct HeaderText: View {
    let label: String
    var body: some View {
        Text(label)
            .font(.h3)
            .foregroundStyle(Constants.Colors.black90)
            .padding(.horizontal, 16)
            .padding(.bottom, 8)
    }
}

#Preview {
    PreviewContainer {
        MyPageQuestionScreen()
    }
}
