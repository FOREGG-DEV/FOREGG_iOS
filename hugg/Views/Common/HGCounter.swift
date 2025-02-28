import SwiftUI

struct HGCounter: View {
    @Binding var cnt: Int
    var maxValue: Int? = nil

    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 8.0, bottomLeading: 8.0, bottomTrailing: 0.0, topTrailing: 0.0))
                    .fill(cnt == 0 ? .disabled : .main)
                    .frame(width: 51, height: 48)
                Image(systemName: "minus")
                    .resizable()
                    .foregroundStyle(.white)
                    .frame(width: 20, height: 4)
            }
            .onTapGesture {
                if cnt > 0 {
                    cnt -= 1
                }
                print(cnt)
            }

            Text(String(cnt))
                .frame(width: 51, height: 48)
                .background(.white)

            ZStack {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0.0, bottomLeading: 0.0, bottomTrailing: 8.0, topTrailing: 8.0))
                    .fill(maxValue != nil && cnt >= maxValue! ? .disabled : .main)

                Image(systemName: "plus")
                    .resizable()
                    .foregroundStyle(.white)
                    .frame(width: 20, height: 20)
            }
            .frame(width: 51, height: 48)
            .onTapGesture {
                // prevent count increase over max value
                // if max value is given
                if maxValue != nil && cnt >= maxValue! {
                    return
                }

                cnt += 1
            }
        }
    }
}

// MARK: .constant를 활용해서 예시 값 출력 가능

#Preview {
    ZStack {
        Color(.mainBg).ignoresSafeArea()
        HGCounter(cnt: .constant(3))
    }
}
