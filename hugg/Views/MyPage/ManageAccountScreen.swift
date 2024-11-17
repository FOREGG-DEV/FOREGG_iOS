import PopupView
// TODO: 로그아웃 기능 구현
// TODO: 회원 탈퇴 기능 구현
// TODO: 팝업 구현
// TODO: Binding() 공부하기
import SwiftUI

enum ManageAccountPopupConfig: Equatable {
    case logout
    case withdrawal
    case alert(title: String, btnLabel: String)
}

struct ManageAccountScreen: View {
    @EnvironmentObject private var appState: AppState
    @Environment(\.dismiss) var dismiss
    // local states
    @State private var currentPopup: ManageAccountPopupConfig?

    private func logout() {
        currentPopup = .logout
    }

    private func withdrawal() {
        currentPopup = .withdrawal
    }

    var body: some View {
        VStack {
            AppBar(title: "계정관리", onBack: {
                _ = appState.routes.popLast()
            })

            List {
                Section {
                    Button(action: {
                        logout()
                    }) {
                        Text("계정 로그아웃")
                            .font(.p2)
                            .foregroundStyle(.kBlack)
                            .padding(.vertical, 10)
                    }
                }

                Button(action: {
                    withdrawal()
                }) {
                    Text("계정 탈퇴")
                        .font(.p2)
                        .foregroundStyle(.withdrawal)
                        .padding(.vertical, 10)
                }
            }
            .listStyle(.insetGrouped)
            .listSectionSpacing(.compact)
            .scrollContentBackground(.hidden)
            .padding(.zero)
        }
        .background(.mainBg)
        .gesture(
            DragGesture(minimumDistance: 20, coordinateSpace: .global)
                .onChanged { value in // onChanged better than onEnded for this case
                    guard value.startLocation.x < 20, // starting from left edge
                          value.translation.width > 60
                    else { // swiping right
                        return
                    }
                    dismiss()
                }
        )
        .popup(isPresented: Binding(get: { currentPopup != nil }, set: { newValue in
            if !newValue {
                currentPopup = nil
            }
        })) {
            // chekc currentPopup is not nil
            if let popup = currentPopup {
                switch popup {
                case .logout:
                    SelectablePopup(
                        onCancel: {
                            currentPopup = nil
                        },
                        onConfirm: {
                            currentPopup = .alert(title: "로그아웃이 완료되었습니다.", btnLabel: "확인")
                        },
                        title: "Hugg에서 로그아웃하시겠습니까?",
                        confirmBtnLabel: "로그아웃"
                    )
                case .alert(let title, let label):
                    AlertPopup(onConfirm: {
                        currentPopup = nil
                    }, title: title, btnLabel: label)
                case .withdrawal:
                    SelectablePopup(
                        onCancel: {
                            currentPopup = nil
                        },
                        onConfirm: {},
                        title: "Hugg에서 탈퇴하시겠습니까?",
                        confirmBtnLabel: "탈퇴"
                    )
                }
            }
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

#Preview {
    ManageAccountScreen()
        .background(.mainBg)
}


