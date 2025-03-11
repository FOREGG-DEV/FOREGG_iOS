import Foundation

struct UserSpouseCodeResponseDTO: Codable {
    let spouseCode: String

    init(spouseCode: String) {
        self.spouseCode = spouseCode
    }
}
