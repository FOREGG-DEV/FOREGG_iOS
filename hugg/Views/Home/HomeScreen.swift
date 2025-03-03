import SwiftUI

// TODO: Implement Population

struct HomeScreen: View {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject var model: HomeScreenModel
    @EnvironmentObject var myPageModel: MyPageModel

    @State private var viewStatus: ViewStatus = .loading

    var body: some View {
        VStack(alignment: .center) {
            HGHomeAppBar()
            switch self.viewStatus {
            case .loading:
                HGProgressView()
            case .success:
                Group {
                    HStack {
                        Text("강허그님의\n7월29일 일정이에요.")
                            .font(.h2)
                            .foregroundStyle(.kBlack)
                            .padding(.bottom, 8)

                        Spacer()
                    }

                    // MARK: Empty schedule indicator

                    //                HGEmptyScheduleItem()

                    // MARK: schedule items

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) {
                                if $0 == 0 {
                                    HGHomeScheduleItem()
                                } else {
                                    HGHomeScheduleItem(borderFocused: false)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }

                    Spacer()
                        .frame(height: 32)

                    // TODO: Implement dynamic banner, add tap event
                    Image("banner")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 32)
                        .onTapGesture {}

                    VStack {
                        HStack {
                            Text("생활습관 챌린지")
                                .font(.h2)
                                .foregroundStyle(.black90)
                            Spacer()
                            Image(systemName: "arrow.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 14, height: 14)
                                .foregroundStyle(.black50)
                        }
                        .padding(.bottom, 8)

                        VStack {
                            Text("챌린지에 참여해보세요.")
                                .font(.h4)
                                .foregroundStyle(.black70)
                                .padding(.bottom, 4)
                            Text("다양한 생활 습관 챌린지를 같이 할 수 있어요")
                                .font(.p3)
                                .foregroundStyle(.black50)
                                .padding(.bottom, 16)

                            Text("챌린지 참여")
                                .font(.h4)
                                .foregroundStyle(.black70)
                        }
                        .padding(22)
                        .frame(maxWidth: .infinity, minHeight: 0)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .onTapGesture {
                        // go to challenge
                    }
                }
                .padding(.horizontal, 16)
            case .failure:
                HGErrorView {
                    Task {
                        await populateHomeScreen()
                    }
                }
            }

            Spacer()
        }
        .background(.mainBg)
        .task {
            if self.model.homeData == nil {
                await populateHomeScreen()
            }
        }
    }
}

extension HomeScreen {
    private func populateHomeScreen() async {
        self.viewStatus = .loading
        print("get home data")
        do {
            try await self.model.fetchDummy()
            self.viewStatus = .success
        } catch {
            self.viewStatus = .failure(error.localizedDescription)
        }
    }
}

#Preview {
    PreviewContainer {
        HomeScreen()
            .environmentObject(HomeScreenModel())
            .environmentObject(MyPageModel())
    }
}
