//
//  HGTag.swift
//  hugg
//
//  Created by Donghan Kim on 1/14/25.
//

import SwiftUI

struct HGTag: View {
    let label: String
    var background: Color? = nil

    var body: some View {
        Text(label)
            .font(.p3)
            .foregroundStyle(Constants.Colors.black80)
            .padding(.horizontal, 9)
            .padding(.vertical, 1.5)
            .background(background ?? Constants.Colors.calendarEtc)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    HGTag(label: "string")
}
