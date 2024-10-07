import Foundation

enum SurgeryType: String, CaseIterable, Identifiable {
    case THINK_SURGERY = "시술 고민 중"
    case IUI = "인공수정(자궁 내 정자 주입술)"
    case EGG_FREEZING = "난자 동결"
    case IN_VITRO_FERTILIZATION = "체외 수정(시험관 아기)"
    var id: SurgeryType { self }
}
