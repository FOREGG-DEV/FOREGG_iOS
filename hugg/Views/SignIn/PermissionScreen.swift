//
//  PermissionView.swift
//  hugg
//
//  Created by Donghan Kim on 12/27/24.
//

import SwiftUI

struct PermissionScreen: View {
    var body: some View {
        VStack(alignment: .leading) {
            AppBarWithoutBtn(title: "알림")
            Spacer()
                .frame(height: 32)
            VStack(alignment: .leading) {
                HStack {
                    Text("앱 접근 권한을 안내드려요")
                        .font(.pretendardSemiBold24)
                        .foregroundStyle(.black80)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                .padding(.bottom, 4)
                Text("허그는 꼭 필요한 권한만 선택적으로 받고 있어요!")
                    .font(.h3)
                    .foregroundStyle(.black70)

                Spacer().frame(height: 33)

                VStack(alignment: .center) {
                    Text("아래 선택 접근 권한은 해당 기능 이용 시 동의를 받고 있으며,\n비 허용 시에도 해당 기능 외 서비스 이용이 가능합니다.")
                        .font(.p3L)
                        .foregroundStyle(.black80)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 16)

                    HGPermissionHeadingLabel(label: "선택적 접근 권한")

                    HGPermissionItem(label: "알림", desc: "캘린더 알림, 챌린지, 데일리허그", imageName:
                        "homeFill")

                    HGPermissionItem(label: "사진 및 카메라", desc: "데일리허그", imageName:
                        "homeFill")

                    Spacer().frame(height: 24)

                    HGPermissionHeadingLabel(label: "접근권한 변경")

                    HStack {
                        Text("휴대폰 설정 > Hugg")
                            .font(.h4)
                            .foregroundStyle(.black90)
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 0)
                .padding(12)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))

                Spacer()
            }
            .padding(.horizontal, 16)

            HGBorderedButton(label: "다음", isEnabled: true, action: {})
                .padding(.horizontal, 16)
                .padding(.bottom, 70)
        }
        .background(.mainBg)
    }
}

#Preview {
    PermissionScreen()
}

// Views

private struct HGPermissionItem: View {
    let label: String
    let desc: String
    let imageName: String
    var body: some View {
        HStack(alignment: .center) {
            Image(imageName)
                .resizable()
                .frame(width: 48, height: 48)
            VStack(alignment: .leading) {
                Text(label)
                    .font(.h3)
                    .foregroundStyle(.black90)
                Text(desc)
                    .font(.p2L)
                    .foregroundStyle(.black90)
            }
            Spacer()
        }
    }
}

private struct HGPermissionHeadingLabel: View {
    let label: String

    var body: some View {
        HStack {
            Text(label)
                .font(.p2)
                .foregroundStyle(.mainStrong)
            Spacer()
        }
        .padding(.bottom, 4)
    }
}
