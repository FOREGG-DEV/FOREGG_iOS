//
//  HGErrorFragment.swift
//  hugg
//
//  Created by Donghan Kim on 2/28/25.
//

import SwiftUI

struct HGErrorView: View {
    let onTapRefresh: () -> Void

    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image("sad_hug")
                .frame(width: 120, height: 120)
                .padding(.bottom, 24)

            Text("인터넷 연결이 불안정해요")
                .font(.h1)
                .foregroundStyle(Constants.Colors.black70)
                .padding(.bottom, 8)

            Text("Wi-Fi나 셀룰러 데이터 연결 상태를\n확인하고 다시 시도해주세요.")
                .multilineTextAlignment(.center)
                .font(.p2)
                .foregroundStyle(Constants.Colors.black70)
                .frame(alignment: .center)
            Spacer()
                .frame(height: 40)
            HGMainButton(label: "재시도", action: onTapRefresh)
                .padding(.horizontal, 16)
            Spacer()
        }
    }
}

#Preview {
    HGErrorView(onTapRefresh: {
        print("tap refresh")
    })
}
