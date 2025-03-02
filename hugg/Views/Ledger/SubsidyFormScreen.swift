//
//  SubsidyFormScreen.swift
//  hugg
//
//  Created by Donghan Kim on 2/28/25.
//

import SwiftUI

enum SubsidyFormMode {
    case create
    case edit(SubsidyDetailResponseDTO)
}

struct SubsidyFormScreen: View {
    let mode: SubsidyFormMode
    // 중복 이름 안되도록 설정해야함 -> 기존의 Subsidy 데이터도 조회해야함
    // mode가 edit인 경우에는 DTO에서 기본 데이터 가져와야함
    @State var nickname: String = ""
    // subsidy content
    @State var content: String = ""
    @State var count: Int = 0
    @State var amount: Int = 0
    // 외부에서 appState 변수 참조할 수 없도록 -> 각 스크린마다 독립적으로 사용
    @EnvironmentObject private var appState: AppState

    var isValid: Bool {
        if nickname == "" {
            return false
        }
        return true
    }

    var body: some View {
        VStack {
            HGAppBar(title: "지원금 추가", onBack: {
                _ = appState.routes.popLast()
            })
            .padding(.bottom, 24)

            ScrollView {
                VStack(alignment: .leading) {
                    SubsidyFormTitle(label: "지원금 별명*")

                    SubsidyFormTitle(label: "지원금 내용")

                    SubsidyFormTitle(label: "지원금 총액*")
                }
            }
        }
    }
}

struct SubsidyFormTitle: View {
    let label: String

    var body: some View {
        Text(label)
            .font(.h3)
            .foregroundStyle(Constants.Colors.black80)
    }
}

#Preview {
    PreviewContainer {
        SubsidyFormScreen(mode: .create)
    }
}
