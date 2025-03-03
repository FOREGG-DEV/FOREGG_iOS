//
//  HGTextBorderedButton.swift
//  hugg
//
//  Created by Donghan Kim on 3/4/25.
//

import SwiftUI

struct HGTextBorderedButton: View {
    let label: String
    let onTap: () -> Void

    var body: some View {
        Text(label)
            .font(.p3)
            .foregroundStyle(Constants.Colors.black50)
            .padding(.horizontal, 8)
            .padding(.vertical, 3.5)
            .background(Color.white)
            .overlay {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Constants.Colors.black20, lineWidth: 1)
            }
            .padding(.trailing, 16)
            .onTapGesture {
                onTap()
            }
    }
}

#Preview {
    HGTextBorderedButton(label: "지원금 항목 추가") {}
}
