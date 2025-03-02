import Foundation

struct SubsidyDetailResponseDTO: Codable {
    enum Color: String, Codable {
        case blue = "BLUE"
        case green = "GREEN"
        case yellow = "YELLOW"
        case red = "RED"
    }

    var id: Int64?
    var nickname: String?
    var color: Color?
    var amount: Int?
    var expenditure: Int?
    var available: Int?
    var percent: Int?

    init(id: Int64? = nil, nickname: String? = nil, color: Color? = nil, amount: Int? = nil, expenditure: Int? = nil, available: Int? = nil, percent: Int? = nil) {
        self.id = id
        self.nickname = nickname
        self.color = color
        self.amount = amount
        self.expenditure = expenditure
        self.available = available
        self.percent = percent
    }

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case nickname
        case color
        case amount
        case expenditure
        case available
        case percent
    }
}
