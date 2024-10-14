import SwiftUI

// TODO: Check textfields
// TODO: Check keyboard padding
// TODO: Keyboard disappear

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
    fileprivate let limit = 1
    @EnvironmentObject private var vm: SignUpViewModel

    @FocusState private var focusField: SSNFocusEnum?

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("주민번호")
                    .font(.pretendardSemiBold24)
                    .foregroundStyle(.black80) +
                    Text(" 앞 7자리").font(.pretendardSemiBold24).foregroundStyle(.main) + Text("를\n적어주세요.")
                    .font(.pretendardSemiBold24)
                    .foregroundStyle(.black80)
            }
            .padding(.bottom, 12)
            HStack {
                TextField("", text: $vm.ssn.ssn1)
                    .maxLength(text: $vm.ssn.ssn1, limit)
                    .focused($focusField, equals: .ssn1)
                    .textFieldStyle(SSNTextfieldStyle())
                    .onChange(of: vm.ssn.ssn1) { _, next in
                        if next.isEmpty {
                        } else {
                            focusField = .ssn2
                        }
                    }

                TextField("", text: $vm.ssn.ssn2)
                    .maxLength(text: $vm.ssn.ssn2, limit)
                    .focused($focusField, equals: .ssn2)
                    .textFieldStyle(SSNTextfieldStyle())
                    .onChange(of: vm.ssn.ssn2) { _, next in
                        if next.isEmpty {
                            focusField = .ssn1
                        } else {
                            focusField = .ssn3
                        }
                    }

                TextField("", text: $vm.ssn.ssn3)
                    .maxLength(text: $vm.ssn.ssn3, limit)
                    .focused($focusField, equals: .ssn3)
                    .textFieldStyle(SSNTextfieldStyle())
                    .onChange(of: vm.ssn.ssn3) { _, next in
                        if next.isEmpty {
                            focusField = .ssn2
                        } else {
                            focusField = .ssn4
                        }
                    }

                TextField("", text: $vm.ssn.ssn4)
                    .maxLength(text: $vm.ssn.ssn4, limit)
                    .focused($focusField, equals: .ssn4)
                    .textFieldStyle(SSNTextfieldStyle())
                    .onChange(of: vm.ssn.ssn4) { _, next in
                        if next.isEmpty {
                            focusField = .ssn3
                        } else {
                            focusField = .ssn5
                        }
                    }

                TextField("", text: $vm.ssn.ssn5)
                    .maxLength(text: $vm.ssn.ssn5, limit)
                    .focused($focusField, equals: .ssn5)
                    .textFieldStyle(SSNTextfieldStyle())
                    .onChange(of: vm.ssn.ssn5) { _, next in
                        if next.isEmpty {
                            focusField = .ssn4
                        } else {
                            focusField = .ssn6
                        }
                    }

                TextField("", text: $vm.ssn.ssn6)
                    .maxLength(text: $vm.ssn.ssn6, limit)
                    .focused($focusField, equals: .ssn6)
                    .textFieldStyle(SSNTextfieldStyle())
                    .onChange(of: vm.ssn.ssn6) { _, next in
                        if next.isEmpty {
                            focusField = .ssn5
                        } else {
                            focusField = .ssn7
                        }
                    }

                Rectangle()
                    .frame(width: 6, height: 2.5)
                    .foregroundStyle(.black50)

                TextField("", text: $vm.ssn.ssn7)
                    .maxLength(text: $vm.ssn.ssn7, limit)
                    .focused($focusField, equals: .ssn7)
                    .textFieldStyle(SSNTextfieldStyle())
                    .onChange(of: vm.ssn.ssn7) { _, next in
                        if next.isEmpty {
                            focusField = .ssn6
                        }
                    }
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 100, height: 48)
                    .foregroundStyle(.whiteF2)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

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
    .environmentObject(SignUpViewModel())
}
