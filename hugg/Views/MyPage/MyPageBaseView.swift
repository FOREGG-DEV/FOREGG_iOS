//
//  MyPageBaseView.swift
//  hugg
//
//  Created by Donghan Kim on 10/16/24.
//

import SwiftUI

struct MyPageBaseView: View {
    let title: String
    var body: some View {
        Text(title)
    }
}

#Preview {
    MyPageBaseView(title: "Hello world")
}
