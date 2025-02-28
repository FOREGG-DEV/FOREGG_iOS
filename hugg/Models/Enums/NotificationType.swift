import Foundation

enum NotificationType: String, Codable {
    case clap = "CLAP"
    case support = "SUPPORT"
    case reply = "REPLY"

    var displayName: String {
        switch self {
            case .clap: return "박수"
            case .reply: return "답장"
            case .support: return "응원"
        }
    }
}
