import SwiftUI

// TODO: Check textfields
// TODO: Check keyboard padding
// TODO: Keyboard disappear

// TODO: Check TextField auto focus
// TODO: Control Keyboard inputs in SwiftUI

enum SSNFocusEnum {
    case ssn1
    case ssn2
    case ssn3
    case ssn4
    case ssn5
    case ssn6
    case ssn7
}

struct EnterSSNView: View {
    // text limit
    @EnvironmentObject var vm: SignUpViewModel
    private let limit = 1
    @State var currentInput: String = ""

//    @FocusState private var focusField: SSNFocusEnum?

    var body: some View {
        VStack(alignment: .leading) {
            SSNTitleView()
            TextField("", text: $currentInput).opacity(0)
            HStack {
                SSNInputView()
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 100, height: 48)
                    .foregroundStyle(.whiteF2)
            }
        }
        .frame(maxWidth: .infinity)
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

// MARK: - SSNInputView

struct SSNInputView: View {
    // 입력된 SSN 데이터
    @EnvironmentObject var state: SignUpState
    @State private var ssn: String = ""
    @FocusState private var isKeyboardFocused: Bool

    var body: some View {
        VStack {
            // 1. SSN 박스 출력 (각 자리마다 박스로 표시)
            HStack(spacing: 8) {
                Text(state.ssn.ssn1)
                    .frame(width: 40, height: 40)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .font(.title2)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                Text(state.ssn.ssn2)
                    .frame(width: 40, height: 40)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .font(.title2)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                Text(state.ssn.ssn3)
                    .frame(width: 40, height: 40)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .font(.title2)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
            .padding(.bottom, 20)

            // 2. 숨겨진 TextField
            TextField("", text: $ssn)
                .keyboardType(.numberPad)
                .focused($isKeyboardFocused)
                .onChange(of: ssn) { newValue, oldValue in
                    handleInput(newValue)
                    print(oldValue)
                }
                .onSubmit {
                    handleCompletion()
                }
                .opacity(0) // 보이지 않도록 설정
                .frame(width: 0, height: 0)

            // 3. 키보드 완료 버튼 처리 (가이드)
            Button("완료") {
                handleCompletion()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .onAppear {
            isKeyboardFocused = true // 키보드 자동 표시
        }
    }
}

extension SSNInputView {
    /// 키보드 입력에 따라 SSN 데이터 업데이트
    private func handleInput(_ newValue: String) {
        // 숫자만 허용하고 최대 7자리까지만 입력
        let filtered = newValue.filter { $0.isNumber }
        if filtered.count <= 7 {
            ssn = filtered
        } else {
            ssn = String(filtered.prefix(7))
        }
    }

    /// 완료 버튼 처리
    private func handleCompletion() {
        guard ssn.count == 7 else { return }
        isKeyboardFocused = false

        // 성별 판단
        if let genderIndicator = ssn.last,
           let gender = Int(String(genderIndicator))
        {
            let genderText = (gender == 1 || gender == 3) ? "남자" : "여자"
            print("성별: \(genderText)")
        }

        // 다음 화면으로 이동 (여기선 print로 대체)
        print("SSN 입력 완료: \(ssn)")
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
    .environmentObject(SignUpViewModel())
    .environmentObject(SignUpState())
}
