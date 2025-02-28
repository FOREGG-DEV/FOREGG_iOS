import SwiftUI

// TODO: Add Link to DailyHug Screen

struct NotificationScreen: View {
    @EnvironmentObject private var appState: AppState
    @StateObject private var model: NotificationModel = .init()

    @State var viewStatus: ViewStatus = .loading

    var body: some View {
        VStack {
            AppBar(title: "알림", onBack: {
                _ = self.appState.routes.popLast()
            })
            switch self.viewStatus {
            case .loading:
                HGProgressView()
            case .success:
                ForEach(self.model.notifications) { noti in
                    HStack(alignment: .center) {
                        Text("\(noti.sender ?? "None")님으로부터  \(noti.notificationType?.displayName ?? "답장")이 도착했어요.")
                            .font(.h3)
                            .foregroundStyle(Constants.Colors.black90)
                        Spacer()
                        Text("5분 전")
                            .font(.p3L)
                            .foregroundStyle(Constants.Colors.black50)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .padding(.horizontal, 16)
                }
            case .failure(let string):
                HGErrorView {
                    Task {
                        await populateNotification()
                    }
                }
            }
            Spacer()
        }
        .background(Constants.Colors.backgroundMain)
        .task {
            await populateNotification()
        }
    }
}

#Preview {
    PreviewContainer {
        NotificationScreen()
    }
}

// logics
extension NotificationScreen {
    private func populateNotification() async {
        do {
            self.viewStatus = .loading
            try await self.model.populateNotificationScreen()
            self.viewStatus = .success
        } catch {
            self.viewStatus = .failure(error.localizedDescription)
        }
    }
}
