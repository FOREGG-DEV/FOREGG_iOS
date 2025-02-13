import Foundation

enum SurgeryType: String, CaseIterable, Identifiable, Codable {
    case THINK_SURGERY
    case IUI
    case EGG_FREEZING
    case IN_VITRO_FERTILIZATION

    var id: SurgeryType { self }

    /// UI에서 표시할 한국어 문자열
    var displayName: String {
        switch self {
        case .THINK_SURGERY:
            return "시술 고민 중"
        case .IUI:
            return "인공수정(자궁 내 정자 주입술)"
        case .EGG_FREEZING:
            return "난자 동결"
        case .IN_VITRO_FERTILIZATION:
            return "체외 수정(시험관 아기)"
        }
    }
}
