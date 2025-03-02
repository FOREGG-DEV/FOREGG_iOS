import Foundation

struct SubsidyResponseDTO: Codable {
    var subsidyDetailResponseDTOS: [SubsidyDetailResponseDTO]?

    init(subsidyDetailResponseDTOS: [SubsidyDetailResponseDTO]? = nil) {
        self.subsidyDetailResponseDTOS = subsidyDetailResponseDTOS
    }
}
