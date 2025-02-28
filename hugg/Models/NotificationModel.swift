import SwiftUI

enum NotificationError: Error {
    case unknown
}

@MainActor
class NotificationModel: ObservableObject {
    // 빈 배열로 초기화
    @Published var notifications: [NotificationDTO] = []

    let httpClient = HTTPClient()

    /// [GET]
    func populateNotificationScreen() async throws {
        print("begin populate")
        // TODO: get notifications here
        // get NotifcationResponseDTO here from server
        try await Task.sleep(for: .seconds(1))
        notifications = NotificationDTO.sampleNotifications
        print("end populate")
//        throw NotificationError.unknown
    }
}
