//
//  SkeletonBox.swift
//  hugg
//
//  Created by Donghan Kim on 8/6/24.
//

import SwiftUI

// self == this
struct SkeletonBox: View {
    let label: String?
    let width: Double?
    let height: Double?

    // set default value to nil
    init(label: String? = nil, width: Double? = nil, height: Double? = nil) {
        self.label = label
        self.width = width
        self.height = height
    }

    var body: some View {
        Rectangle()
            .fill(.main)
            .frame(width: width ?? 100, height: height ?? 100)
            .overlay {
                Text(label ?? "label")
            }
    }
}

// MARK: Why use "some" keyword to body of view

#Preview {
    SkeletonBox()
}
