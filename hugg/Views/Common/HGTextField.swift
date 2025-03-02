//
//  HGTextField.swift
//  hugg
//
//  Created by Donghan Kim on 3/2/25.
//

import SwiftUI

struct HGTextField: View {
    /// 바인딩할 변수
    @Binding var text: String
    /// placeholder 텍스트
    let label: String
    var limitCount: Int? = nil

    var limit: Int {
        limitCount ?? 20
    }

    var body: some View {
        TextField(
            "",
            text: $text,
            prompt: Text(label)
                .font(.h3)
                .foregroundStyle(Constants.Colors.black50)
        )
        .onChange(of: text) { _, newValue in
            if newValue.count > limit {
                self.text = String(newValue.prefix(limit))
            }
        }
        .font(.h3)
        .foregroundStyle(Constants.Colors.black90)
        .padding(13)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal, 16)
    }
}

#Preview {
    VStack {
        Spacer()
        HGTextField(text: .constant("내용이 있는 경우"), label: "label")
        Spacer()
    }
    .background(Constants.Colors.backgroundMain)
}

// private struct AddLedgerTextField: View {
//    @Binding var text: String
//    let label: String
//    var body: some View {
//        TextField(
//            "",
//            text: $text,
//            prompt: Text(label)
//                .font(.h3)
//                .foregroundStyle(Constants.Colors.black50)
//        )
//        .padding(13)
//        .background(Color.white)
//        .clipShape(RoundedRectangle(cornerRadius: 8))
//        .padding(.horizontal, 16)
//    }
// }
