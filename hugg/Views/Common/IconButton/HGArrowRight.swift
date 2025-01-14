//
//  HGArrowRight.swift
//  hugg
//
//  Created by Donghan Kim on 1/14/25.
//

import SwiftUI

struct HGArrowRight: View {
    var color: Color? = nil

    var body: some View {
        Image(systemName: "arrow.right")
            .resizable()
            .scaledToFit()
            .frame(width: 14, height: 14)
            .foregroundStyle(color ?? .black50)
    }
}

#Preview {
    HGArrowRight()
}
