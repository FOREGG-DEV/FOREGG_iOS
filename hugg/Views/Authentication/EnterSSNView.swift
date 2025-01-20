import SwiftUI

// TODO: Check textfields
// TODO: Check keyboard padding
// TODO: Keyboard disappear

// TODO: Check TextField auto focus
// TODO: Control Keyboard inputs in SwiftUI

private enum FocusField: Hashable {
    case field
}

struct EnterSSNView: View {
    @EnvironmentObject var state: SignUpState
    @State private var ssn: String = ""
    @FocusState private var focusField: FocusField?

    var body: some View {
        VStack(alignment: .leading) {
            SSNTitleView()
            VStack {
                // 1. SSN 박스 출력 (각 자리마다 박스로 표시)
                HStack(spacing: 8) {
                    ForEach(state.ssn.ssnDigits, id: \.self) { digit in

                        RoundedRectangle(cornerRadius: 5)
                            .fill(.white)
                            .frame(width: 30, height: 50)
                            .overlay {
                                Text(digit)
                                    .font(.h3)
                                    .foregroundColor(Constants.Colors.black90)
                            }
                    }

                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 100, height: 48)
                        .foregroundStyle(.whiteF2)
                }
                .onTapGesture {
                    focusField = .field
                }
                .padding(.bottom, 20)

                // 2. 숨겨진 TextField
                TextField("", text: $ssn)
                    .keyboardType(.numberPad)
                    .focused($focusField, equals: .field)
                    .onChange(of: ssn) { _, newValue in
                        handleInput(newValue)
                    }
                    .frame(width: 0, height: 0)
                    .opacity(0)
            }
            .onAppear {
                if state.ssn.fullSSN.contains(where: { $0.isNumber }) {
                    ssn = state.ssn.fullSSN
                }
            }

            Spacer()

            SignUpFooter(
                onButtonTapped: {
                    focusField = nil
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        state.increaseStep()
                    }
                },
                buttonEnable: state.ssn.isValid
            )
        }
        .frame(maxWidth: .infinity)
    }
}

extension EnterSSNView {
    private func handleInput(_ value: String) {
        state.ssn.updateSSN(with: value)
    }

    /// 완료 버튼 처리
    private func handleCompletion() {
        guard ssn.count == 7 else { return }

        // 성별 판단
        if let genderIndicator = ssn.last,
           let gender = Int(String(genderIndicator))
        {
            let genderText = (gender == 1 || gender == 3) ? "남자" : "여자"
            print("성별: \(genderText)")
        }

        state.ssn.updateSSN(with: ssn)

        // 다음 화면으로 이동 (여기선 print로 대체)
        print("SSN 입력 완료: \(state.ssn.fullSSN)")
    }
}

// MARK: - SSN Title View

private struct SSNTitleView: View {
    fileprivate var body: some View {
        VStack(alignment: .leading) {
            Text("주민번호")
                .font(.pretendardSemiBold24)
                .foregroundStyle(.black80) +
                Text(" 앞 7자리").font(.pretendardSemiBold24).foregroundStyle(.main) + Text("를\n적어주세요.")
                .font(.pretendardSemiBold24)
                .foregroundStyle(.black80)
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding(.bottom, 12)
    }
}

// MARK: - Preview

#Preview {
    VStack {
        ZStack {
            Color(.mainBg)
            HStack {
                EnterSSNView()
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
    }
    .padding(.horizontal, 16.0)
    .background(Constants.Colors.backgroundMain)
    .environmentObject(SignUpState())
}
