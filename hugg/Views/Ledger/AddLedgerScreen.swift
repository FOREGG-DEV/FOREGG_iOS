// TODO: AddLedgerScreen Implementation

// DTO 예제 만들기
// UI 만들기
// UI components 분리
// model 생성, dto 만들기
// 실패 시 에러 팝업 띄우기

import SwiftUI

enum AddLedgerPopup: Equatable {
    case alert(title: String, btnLabel: String)
}

struct AddLedgerScreen: View {
    @State private var selectedCount: Int = 0
    @State private var selectedDate: Date = .now
    @State private var content: String = ""
    @State private var memo: String = ""

    @EnvironmentObject private var appState: AppState

    // count 선택

    var body: some View {
        VStack {
            AppBar(title: "가계부 추가", onBack: {
                _ = appState.routes.popLast()
            })
            .padding(.bottom, 24)

            AddLedgerTitle(label: "날짜*")

            // Date Picker
            HStack(spacing: 0) {
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 8.0, bottomLeading: 8.0, bottomTrailing: 0.0, topTrailing: 0.0))
                        .fill(.main)
                        .frame(width: 48, height: 48)
                    Image(systemName: "calendar")
                        .foregroundStyle(.white)
                        .frame(width: 20, height: 20)
                }
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0.0, bottomLeading: 0.0, bottomTrailing: 8.0, topTrailing: 8.0))
                        .fill(.white)

                    Text("\(selectedDate, formatter: yearMonthDayFormatter)")
                        .font(.h3)
                }
                .frame(maxWidth: .infinity, maxHeight: 48)
            }
            .padding(.horizontal, 16)
            .overlay {
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .labelsHidden()
                    .colorMultiply(.clear)
            }

            // Round Picker
            AddLedgerTitle(label: "회차*")
            HGCounter(cnt: $selectedCount)
            Spacer()

            // subsidy data from model
            // TextField 구성
        }
        .background(Constants.Colors.backgroundMain)
    }
}

extension AddLedgerScreen {
    func addLedger() async {
        // create request dto
        let dto = LedgerRequestDTO(count: selectedCount)
        // POST -> ledgerModel
    }
}

private struct AddLedgerTitle: View {
    let label: String

    var body: some View {
        HStack {
            Text(label)
                .font(.h3)
                .foregroundStyle(Constants.Colors.black80)
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 4)
    }
}

#Preview {
    PreviewContainer {
        AddLedgerScreen()
    }
}
