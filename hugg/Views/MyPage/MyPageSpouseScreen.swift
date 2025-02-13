import SwiftUI

struct MyPageSpouseScreen: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var model: MyPageModel

    // boolean for clipboard toast message
    @State var showMessage: Bool = false

    var body: some View {
        VStack {
            AppBar(title: "배우자", onBack: {
                _ = appState.routes.popLast()
            })

            Spacer()
                .frame(height: 24)

            HStack {
                Text("배우자 공유코드")
                    .font(.h3)
                    .foregroundStyle(Constants.Colors.black90)
                // 좌로 정렬
                Spacer()
            }
            .padding(.horizontal, 16.0)

            // Clipboard Trigger
            HStack(spacing: 0) {
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 8.0, bottomLeading: 8.0, bottomTrailing: 0.0, topTrailing: 0.0))
                        .fill(.white)
                    Text(model.myPage?.spouseCode ?? "3DF34")
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
            .padding(.horizontal, 8.0)
            .onTapGesture {
                Task {
                    try await codeToClipboard()
                }
            }

            // Description Text
            HStack {
                Text("남편 회원가입시 붙여넣기 해주세요.")
                    .font(.p3L)
                    .foregroundStyle(Constants.Colors.black90)
                    .padding(.top, 4.0)

                Spacer()
            }
            .padding(.horizontal, 16.0)

            Spacer()
                .frame(height: 8)

            // Clipboard copied
            if showMessage {
                HStack {
                    Spacer()
                    Text("클립보드에 배우자 코드가 복사되었어요!")
                        .font(.p2)
                        .foregroundStyle(Color.white)
                        .padding(10.0)
                    Spacer()
                }
                .background(Constants.Colors.backgroundDim)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal, 16.0)
            }

            Spacer()
        }
        .background(Constants.Colors.backgroundMain)
    }
}

// logics here
extension MyPageSpouseScreen {
    func codeToClipboard() async throws {
        withAnimation {
            showMessage = true
        }

        let pasteboard = UIPasteboard.general
        pasteboard.string = model.myPage?.spouseCode ?? "Clipboard Test"

        try await Task.sleep(for: .seconds(2))

        withAnimation {
            showMessage = false
        }
    }
}

#Preview {
    PreviewContainer {
        MyPageSpouseScreen()
            .environmentObject(MyPageModel())
    }
}
