import SwiftUI

struct DailyHugListScreen: View {
    @EnvironmentObject private var appState: AppState
    var body: some View {
        VStack {
            HGAppBar(title: "데일리 허그 모아보기", onBack: {
                _ = appState.routes.popLast()
            })
            ScrollView {
                VStack(spacing: 12) {
                    DailyHuggListCell()
                    DailyHuggListCell()
                    DailyHuggListCell()
                    DailyHuggListCell()
                    DailyHuggListCell()
                    DailyHuggListCell()
                    DailyHuggListCell()
                    DailyHuggListCell()
                    DailyHuggListCell()
                    DailyHuggListCell()
                    DailyHuggListCell()
                    DailyHuggListCell()
                    DailyHuggListCell()
                    DailyHuggListCell()
                    DailyHuggListCell()
                    DailyHuggListCell()
                    DailyHuggListCell()
                    DailyHuggListCell()
                    DailyHuggListCell()
                    DailyHuggListCell()
                }
                Spacer()
                    .frame(height: 46)
            }
        }
        .background(Constants.Colors.backgroundMain)
    }
}

extension DailyHugListScreen {
    // get every dailyHug
    func populateAllDailyHug() {}
}

#Preview {
    DailyHugListScreen()
        .environmentObject(AppState())
}

private struct DailyHuggListCell: View {
    var body: some View {
        HStack(spacing: 0) {
            Text("09/05")
                .font(.h4)
                .foregroundStyle(Color.white)
                .padding(.horizontal, 6.0)
                .padding(.vertical, 20)
                .background(Constants.Colors.main)
                .clipShape(
                    .rect(
                        topLeadingRadius: 8.0,
                        bottomLeadingRadius: 8.0,
                        bottomTrailingRadius: 0.0,
                        topTrailingRadius: 0.0
                    )
                )
                .frame(height: 60)

            HStack(alignment: .center, spacing: 8) {
                Image("hugEmoji")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)

                Text("오늘은 병원 진료가 늦어져서 그만큼 출근도 늦어짐... 예전부터 진짜 우려했던 일인데 실제로 일어나니까 어떻게 이럴 수가 있지")
                    .font(.p3L)
                    .foregroundStyle(Constants.Colors.black)
                    .lineLimit(2)
            }
            .padding(.horizontal, 6.0)
            .padding(.vertical, 14)
            .background(Color.white)
            .clipShape(
                .rect(
                    topLeadingRadius: 0.0,
                    bottomLeadingRadius: 0.0,
                    bottomTrailingRadius: 8.0,
                    topTrailingRadius: 8.0
                )
            )
        }
        .onTapGesture {
            // implement go to dailyhug detail screen
        }
        .padding(.horizontal, 16)
    }
}
