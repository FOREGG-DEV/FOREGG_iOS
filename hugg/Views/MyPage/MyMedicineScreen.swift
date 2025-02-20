
// TODO: Create View
// TODO: Add logic with dummy data

// TODO: DTO 작업, MyPageModel에 더미데이터 추가
// TODO: VStack -> ListView

import SwiftUI

struct MyMedicineScreen: View {
    // model for medicine screen
    @EnvironmentObject private var model: MyPageModel

    private let tapOption: [String] = ["약", "주사"]
    @State private var selectedTap: String = "전체"
    @State private var currentIndex: Int = 0

    var body: some View {
        VStack(alignment: .center) {
            AppBar(title: "나의 약, 주사 정보", onBack: {})
            // Binding 생성 (Int -> String)
            // newValue -> from get?
            SegmentedView(
                segments: tapOption,
                selected: Binding(
                    get: { tapOption[currentIndex] },
                    set: { newValue in
                        if let newIndex = tapOption.firstIndex(of: newValue) {
                            currentIndex = newIndex
                        }
                    }
                )
            )
            .padding(.horizontal, 16)

            // padding between segment control and tab view
            Spacer()
                .frame(height: 16)

            TabView(selection: $currentIndex) {
                ForEach(0 ..< tapOption.count, id: \.self) { idx in
                    if idx == 0 {
                        VStack {
                            MyMedicineListCell()
                            MyMedicineListCell()
                            MyMedicineListCell()
                            MyMedicineListCell()
                            MyMedicineListCell()
                            MyMedicineListCell()
                            MyMedicineListCell()
                            Spacer()
                        }
                        .padding(.horizontal, 16)

                    } else {
                        VStack {
                            MyMedicineListCell()
                            MyMedicineListCell()
                            MyMedicineListCell()
                            MyMedicineListCell()
                            MyMedicineListCell()
                            MyMedicineListCell()
                            MyMedicineListCell()
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .background(.mainBg)
    }
}

struct MyMedicineListCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("2024.04.01")
                .font(.h4)
                .foregroundStyle(Constants.Colors.black70)
                .padding(.bottom, 4)

            HStack {
                Text("(1정)페모스톤 2/10 노란색")
                    .font(.h2)
                    .foregroundStyle(Constants.Colors.black)

                Spacer()
            }
        }
        .padding(8)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

// MARK: MyPage에서 불러오기 때문에 추가로 불러올 필요는 없을 것 같음

extension MyMedicineScreen {}

#Preview {
    MyMedicineScreen()
        .environmentObject(MyPageModel())
}
