import SwiftUI

struct HGAgreementItem: View {
    // 파라미터: 첫 번째, 두 번째 텍스트 및 바인딩
    let primaryText: String
    let secondaryText: String
    let disableIcon: Bool
    @Binding var isOn: Bool

    init(
        primaryText: String,
        secondaryText: String,
        isOn: Binding<Bool>,
        disableIcon: Bool = false // 기본값 설정
    ) {
        self.primaryText = primaryText
        self.secondaryText = secondaryText
        self._isOn = isOn // Binding은 `_`로 접근
        self.disableIcon = disableIcon
    }

    var body: some View {
        HStack {
            Toggle(isOn: $isOn) {
                HStack {
                    Text(primaryText)
                        .underline(color: .black80)
                        .font(.p2)
                        .foregroundStyle(.black90)
                        + Text(secondaryText)
                        .font(.p2)
                        .foregroundStyle(.black90)

                    Text("(필수)")
                        .font(.p2)
                        .foregroundStyle(.mainStrong)
                }
            }
            .toggleStyle(CheckboxToggleStyle()) // 커스텀 스타일 적용
            Spacer()
            if !disableIcon {
                Image(systemName: "chevron.forward")
                    .foregroundStyle(.black50)
            }
        }
        .padding(.leading, 32)
        .padding(.vertical, 8)
    }
}

struct TermsView: View {
    @EnvironmentObject var state: SignUpViewModel
    @State var termsAgree: Bool = false
    @State var privacyAgree: Bool = false
    @State var ageCheckAgree: Bool = false

    @State var allAgree: Bool = false

    private func updateAllAgreeState() {
        allAgree = termsAgree && privacyAgree && ageCheckAgree
    }

    var body: some View {
        VStack(alignment: .leading) {
            SignUpTitleText(title: "허그를 이용하려면\n약관 동의가 필요해요!")

            HStack {
                Toggle("전체 동의", isOn: $allAgree)
                    .toggleStyle(CheckboxToggleStyle())
                Spacer()
            }
            .padding(EdgeInsets(top: 13, leading: 16, bottom: 13, trailing: 16))
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.main, lineWidth: 1)
            }
            .onChange(of: allAgree) { _, newValue in
                // 전체 동의 상태 변경 시 나머지 업데이트
                termsAgree = newValue
                privacyAgree = newValue
                ageCheckAgree = newValue
            }

            // 개별 항목이 변경되면 allAgree 동기화
            .onChange(of: termsAgree) { _, _ in updateAllAgreeState() }
            .onChange(of: privacyAgree) { _, _ in updateAllAgreeState() }
            .onChange(of: ageCheckAgree) { _, _ in updateAllAgreeState() }

            Spacer()
                .frame(height: 24)

            HGAgreementItem(primaryText: "허그 이용약관", secondaryText: "에 동의합니다.", isOn: $termsAgree)
            HGAgreementItem(primaryText: "개인정보 수집/이용", secondaryText: "에 동의합니다.", isOn: $privacyAgree)
            HGAgreementItem(primaryText: "", secondaryText: "본인은 만 14세 이상입니다.", isOn: $ageCheckAgree, disableIcon: true)
        }
    }
}

#Preview {
    VStack {
        Spacer()
        TermsView()
            .environmentObject(SignUpViewModel())
        Spacer()
    }
    .padding(.horizontal, 16)
    .background(.mainBg)
}
