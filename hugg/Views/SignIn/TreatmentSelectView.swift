//
//  TreatmentSelectView.swift
//  hugg
//
//  Created by Donghan Kim on 9/29/24.
//

import SwiftUI

struct TreatmentSelectView: View {
    @EnvironmentObject var vm: SignUpViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("현재 받고 있는 시술을\n선택해주세요.")
                .font(.pretendardSemiBold24)
                .foregroundStyle(.black80)
                .padding(.bottom, 24.0)
            HStack(spacing: 0) {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 8.0, bottomLeading: 8.0, bottomTrailing: 0.0, topTrailing: 0.0))
                    .fill(.white)
                    .frame(height: 48.0)
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0.0, bottomLeading: 0.0, bottomTrailing: 8.0, topTrailing: 8.0))
                        .fill(.main)
                        .frame(width: 48.0, height: 48.0)
                    Image(systemName: "arrowtriangle.down.fill") // 원하는 이미지
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(.white)
                }
                .frame(width: 48.0, height: 48.0)
            }
        }
    }
}

#Preview {
    TreatmentSelectView()
        .background(.mainBg)
        .padding(.horizontal, 16.0)
}
