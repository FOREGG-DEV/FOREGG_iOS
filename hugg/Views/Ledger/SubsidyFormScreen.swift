//
//  SubsidyFormScreen.swift
//  hugg
//
//  Created by Donghan Kim on 2/28/25.
//

import SwiftUI

// MARK: 남편도 추가, 수정 가능

enum SubsidyFormMode {
    case create
    case edit(SubsidyDetailResponseDTO)
}

// TODO: Add popup config
// 버튼 클릭 시 -> 삭제 팝업
// 확인 시  : 성공 -> popup 닫기 / 실패 -> popup 속성 바꾸기 (에러 팝업으로)

struct SubsidyFormScreen: View {
    let mode: SubsidyFormMode
    // 중복 이름 안되도록 설정해야함 -> 기존의 Subsidy 데이터도 조회해야함
    // mode가 edit인 경우에는 DTO에서 기본 데이터 가져와야함
    @State var nickname: String = ""
    // subsidy content
    @State var content: String = ""
    @State var count: Int = 0
    @State var amount: String = ""
    // 외부에서 appState 변수 참조할 수 없도록 -> 각 스크린마다 독립적으로 사용
    @EnvironmentObject private var appState: AppState

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    var isValid: Bool {
        if nickname == "" {
            return false
        }
        return true
    }

    var screenTitle: String {
        switch mode {
        case .create:
            "지원금 추가"
        case .edit:
            "지원금 수정"
        }
    }

    var body: some View {
        VStack {
            HGAppBarWithTrailing(title: screenTitle, onBack: {
                _ = appState.routes.popLast()
            }, trailing: {
                switch self.mode {
                case .create:
                    Spacer()
                        .frame(width: 24)
                case .edit:
                    Image("ledgerDelete")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 24)
                        .onTapGesture {
                            print("Tap delete")
                        }
                }
            })

            ScrollView {
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height: 24)

                    HStack {
                        SubsidyFormTitle(label: "지원금 별명*")
                        Spacer()
                        Text("최대 2글자")
                            .font(.p3L)
                            .foregroundStyle(Constants.Colors.statusUpdateNotification)
                    }
                    .padding(.horizontal, 16)

                    HGTextField(text: $nickname, label: "지원금 별명 입력", limitCount: 2)

                    Text("지원(별명)으로 표시될 두글자를 적어주세요.")
                        .font(.p3L)
                        .foregroundStyle(Constants.Colors.black50)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 32)

                    SubsidyFormTitle(label: "지원금 내용")
                        .padding(.horizontal, 16)

                    // 지원금 내용 TextField
                    TextField(
                        "",
                        text: $content,
                        prompt: Text("지원금 내용 입력")
                            .font(.h3)
                            .foregroundStyle(Constants.Colors.black50),
                        axis: .vertical
                    )
                    .lineLimit(12 ... 20)
                    .onChange(of: content) { _, newValue in
                        if newValue.count > 250 {
                            self.content = String(newValue.prefix(250))
                        }
                    }
                    .font(.h3)
                    .foregroundStyle(Constants.Colors.black90)
                    .padding(13)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal, 16)
                    .padding(.bottom, 32)

                    SubsidyFormTitle(label: "지원금 총액*")
                        .padding(.horizontal, 16)

                    HStack(alignment: .center, spacing: 2) {
                        TextField(
                            "",
                            text: $amount,
                            prompt: Text("0")
                                .font(.h3)
                                .foregroundStyle(Constants.Colors.black50),
                            axis: .vertical
                        )
                        .keyboardType(.numberPad)
                        .lineLimit(1)
                        .onChange(of: amount) { _, newValue in
                            if newValue.count > 12 {
                                self.amount = String(newValue.prefix(12))
                            }
                        }
                        Text("원")
                            .foregroundStyle(
                                amount == "" ? Constants.Colors.black50 : Constants.Colors.black
                            )
                    }
                    .font(.h3)
                    .foregroundStyle(Constants.Colors.black90)
                    .multilineTextAlignment(.trailing)
                    .padding(13)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal, 16)
                }
                .padding(.bottom, 24)

                HGMainButton(label: "등록", action: {})
                    .padding(.horizontal, 16)
            }
        }
        .background(Constants.Colors.backgroundMain)
    }
}

extension SubsidyFormScreen {
    // TODO: Add create mode
    func createSubsidy() async {}

    // TODO: Add modify mode
    func modifySubsidy() async {}
}

private struct SubsidyFormTitle: View {
    let label: String

    var body: some View {
        Text(label)
            .font(.h3)
            .foregroundStyle(Constants.Colors.black80)
    }
}

#Preview {
    PreviewContainer {
        SubsidyFormScreen(mode: .edit(SubsidyDetailResponseDTO.sample))
    }
}
