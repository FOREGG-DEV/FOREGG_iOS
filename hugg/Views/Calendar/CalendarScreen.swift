//
//  CalendarScreen.swift
//  hugg
//
//  Created by Donghan Kim on 10/7/24.
//

import SwiftUI

struct CalendarScreen: View {
    let daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"]

    // 예시 날짜 배열 (1~30일)
    let daysInMonth = Array(1 ... 30)

    var body: some View {
        VStack {
            // 요일 헤더
            HStack {
                ForEach(daysOfWeek, id: \.self) { day in
                    Text(day)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, 10)

            // 날짜 그리드 (유연한 열 크기)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                ForEach(daysInMonth, id: \.self) { day in
                    VStack {
                        HStack(spacing: 0) {
                            Spacer()
                            Text("\(day)")
                                .frame(height: 106)
                            Spacer()
                        }
                        Spacer()
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                }
            }
        }
        .padding()
    }
}

#Preview {
    CalendarScreen()
}
