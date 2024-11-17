import SwiftUI

struct SelectablePopup: View {
    let onCancel: () -> Void
    let onConfirm: () -> Void
    let title: String
    var cancelBtnLabel: String = "아니요"
    var confirmBtnLabel: String = "예"
    var confirmBtnBackgroundColor: Color = .destructive

    var body: some View {
        VStack(alignment: .center) {
            Text(title)
                .font(.h2)
            Spacer()
                .frame(height: 24)
            HStack {
                Button(action: onCancel) {
                    Text(cancelBtnLabel)
                        .font(.h2)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.black80)
                        .padding(.vertical, 10)
                        .background(.black10)
                        .clipShape(RoundedRectangle(cornerRadius: Constants.Layout.cornerRadiusBtn))
                }

                Button(action: onConfirm) {
                    Text(confirmBtnLabel)
                        .font(.h2)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .padding(.vertical, 10)
                        .background(confirmBtnBackgroundColor)
                        .clipShape(RoundedRectangle(cornerRadius: Constants.Layout.cornerRadiusBtn))
                }
            }
        }
        .padding(.horizontal, 16.0)
        .padding(.top, 40.0)
        .padding(.bottom, 32.0)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: Constants.Layout.cornerRadius))
        .padding(.horizontal, 16.0)
    }
}

#Preview {
    SelectablePopup(onCancel: {}, onConfirm: {}, title: "Preview")
}
