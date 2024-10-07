//
//  SignUpTitleText.swift
//  hugg
//
//  Created by Donghan Kim on 10/7/24.
//

import SwiftUI

struct SignUpTitleText: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.pretendardSemiBold24)
            .foregroundStyle(.black80)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.bottom, 24.0)
    }
}

#Preview {
    SignUpTitleText(title: "예시용 텍스트입니다.")
}
