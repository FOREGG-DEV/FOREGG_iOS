// TODO: AddLedgerScreen Implementation
// - [ ] 지출 작성 Form
// - [ ] 지원금 추가 버튼
// - [ ] LedgerFormScreen으로 리팩토링

// DTO 예제 만들기
// UI 만들기
// UI components 분리
// model 생성, dto 만들기
// 실패 시 에러 팝업 띄우기

// TODO: 설정된 지원금 바탕으로 TextField 생성하기 (how..?)
// 미리 최대 4개까지 만들어두고 Visible을 설정하는 방식은 어떨까?
// 시나리오 정리해보기

// TODO: 수정 페이지에서도 재사용할거임

import SwiftUI

// 추가 - 수정 동시에 사용하기
enum LedgerFormMode {
    case add
    case edit(existingLedger: LedgerResponseDTO) // 수정 시 기존 데이터 전달
}

enum AddLedgerPopup: Equatable {
    case alert(title: String, btnLabel: String)
}

struct AddLedgerScreen: View {
    let mode: LedgerFormMode
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
            ScrollView {
                Spacer()
                    .frame(height: 24)
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

                AddLedgerVGap()

                // Count Picker
                AddLedgerTitle(label: "회차*")
                HStack {
                    HGCounter(cnt: $selectedCount, maxValue: 3)
                    Spacer()
                }
                .padding(.horizontal, 16)

                AddLedgerVGap()

                AddLedgerTitle(label: "내용 및 금액*")
                AddLedgerTextField(text: $content, label: "가계부 내용 입력")

                Spacer()
                    .frame(height: 150)

                // 지출 금액들 (amounts)
                // subsidy data from model
                // TextField 구성

                AddLedgerVGap()

                AddLedgerTitle(label: "메모")
                AddLedgerTextField(text: $memo, label: "메모 입력")
                    .padding(.bottom, 24)

                HGMainButton(label: "등록", action: {
                    Task {
                        await addLedger()
                    }
                })
                .padding(.horizontal, 16)
                .padding(.bottom, 50)
            }
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

private struct AddLedgerTextField: View {
    @Binding var text: String
    let label: String
    var body: some View {
        TextField(
            "",
            text: $text,
            prompt: Text(label)
                .font(.h3)
                .foregroundStyle(Constants.Colors.black50)
        )
        .padding(13)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal, 16)
    }
}

private struct AddLedgerVGap: View {
    var body: some View {
        Spacer()
            .frame(height: 32)
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
        AddLedgerScreen(mode: .add)
    }
}
