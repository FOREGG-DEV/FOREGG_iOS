//
//  HGTagWithoutText.swift
//  hugg
//
//  Created by Donghan Kim on 1/15/25.
//

import SwiftUI

struct HGTagWithoutText: View {
    let color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .inset(by: 3)
            .fill(color)
            .frame(width: 18, height: 18)
    }
}

#Preview {
    ComponentPreviewContainer {
        HGTagWithoutText(color: Constants.Colors.accountbookPersonal)
    }
}
