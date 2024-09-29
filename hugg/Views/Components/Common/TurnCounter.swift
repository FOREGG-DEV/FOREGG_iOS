//
//  TurnCounter.swift
//  hugg
//
//  Created by Donghan Kim on 9/15/24.
//

import SwiftUI

struct TurnCounter: View {
    var body: some View {
        HStack(spacing: 0) {
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 8.0, bottomLeading: 8.0, bottomTrailing: 0.0, topTrailing: 0.0))
                .fill(.disabled)
                .frame(width: 51, height: 48)
            Text("0")
                .frame(width: 51, height: 48)
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0.0, bottomLeading: 0.0, bottomTrailing: 8.0, topTrailing: 8.0))
                .fill(.main)
                .frame(width: 51, height: 48)
        }
    }
}

#Preview {
    TurnCounter()
}
