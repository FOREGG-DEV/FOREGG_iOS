import SwiftUI

struct WifeShareCodeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            SignUpTitleText(title: "배우자 코드를 남편에게\n공유해주세요")

            HStack(spacing: 0) {
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 8.0, bottomLeading: 8.0, bottomTrailing: 0.0, topTrailing: 0.0))
                        .fill(.main)
                        .frame(width: 48, height: 48)
                    Image(systemName: "square.on.square")
                        .foregroundStyle(.white)
                        .frame(width: 20, height: 20)
                }
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0.0, bottomLeading: 0.0, bottomTrailing: 8.0, topTrailing: 8.0))
                        .fill(.white)
                    Text("3DF34")
                        .font(.h3)
                }
                .frame(width: 128, height: 48)
            }

            Spacer()
                .frame(height: 8)
            Text("남편 회원가입시 붙여넣기 해주세요.\n아내 가입 완료 시 남편 로그인이 가능합니다.")
                .font(.p2L)
                .foregroundStyle(.black90)
        }
    }
}

#Preview {
    ZStack {
        Color(.mainBg)
        VStack {
            WifeShareCodeView()
                .padding(.horizontal, 16)
            Spacer()
        }.safeAreaPadding(.vertical, 100)
    }
    .ignoresSafeArea()
}
