import SwiftUI

// add toast

struct DailyHugScreen: View {
    // user data
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var myPageModel: MyPageModel
    // dailyhug data here

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                DailyHugAppBar(onTap: {
                    goListScreen()
                })

                Spacer()
                    .frame(height: 16)

                HStack {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .foregroundStyle(Constants.Colors.black60)
                    Spacer()
                    // date -> "yyyy년 mm월 dd일 요일"
                    Text("2024년 8월 5일 월요일")
                        .font(.h2)
                        .foregroundStyle(Constants.Colors.black90)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .foregroundStyle(Constants.Colors.black60)
                }
                .padding(.horizontal, 48)
                .padding(.bottom, 22)

                // Empty view
                Image("dailyhugEmpty")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 16)

                Spacer()
            }
            HGPlusButton(onTap: {})
                .padding([.trailing, .bottom], 16)
        }
    }
}

extension DailyHugScreen {
    func goListScreen() {
        // 모아보기 스크린으로 이동
//        appState.routes.append()
    }
}

struct DailyHugAppBar: View {
    let onTap: () -> Void
    var body: some View {
        HStack {
            Text("기록 모아보기")
                .font(.p2)
                .foregroundStyle(Constants.Colors.black50)
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(Color.white)
                .hidden()

            Spacer()

            Text("데일리 허그")
                .font(.pretendardSemiBold16)
                .foregroundStyle(.kBlack)

            Spacer()

            Text("기록 모아보기")
                .font(.p2)
                .foregroundStyle(Constants.Colors.black50)
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(Color.white)
                .onTapGesture {
                    onTap()
                }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 15)
        .background(.mainBg)
        .overlay(
            VStack {
                Spacer()
                Divider()
                    .background(.black60)
                    .frame(height: 1)

            })
    }
}

#Preview {
    DailyHugScreen()
        .environmentObject(MyPageModel())
        .environmentObject(AppState())
}
