// TODO: 로그아웃 기능 구현
// TODO: 회원 탈퇴 기능 구현
// TODO: 팝업 구현
import SwiftUI

struct ManageAccountScreen: View {
    @EnvironmentObject private var appState: AppState
    @Environment(\.dismiss) var dismiss

    private func logout() {}
    private func withdrawal() {}

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
    }
}

#Preview {
    ManageAccountScreen()
        .background(.mainBg)
}
