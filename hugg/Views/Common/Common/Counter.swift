import SwiftUI

struct Counter: View {
    // TODO: Change Image (from Figma)
    @Binding var cnt: Int

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
                    .fill(.main)

                Image(systemName: "plus")
                    .resizable()
                    .foregroundStyle(.white)
                    .frame(width: 20, height: 20)
            }
            .frame(width: 51, height: 48)
            .onTapGesture {
                cnt += 1
                print(cnt)
            }
        }
    }
}

// MARK: .constant를 활용해서 예시 값 출력 가능

// TODO: 왜 @State 정상 동작 안하는지 체크

// struct Counter_Preview: PreviewProvider {
//    @State static var test: Int = 0
//
//    static var previews: some View {
//        ZStack {
//            Color(.mainBg).ignoresSafeArea()
//            Counter(cnt: $test)
//        }
//    }
// }

#Preview {
    ZStack {
        Color(.mainBg).ignoresSafeArea()
        Counter(cnt: .constant(3))
    }
}
