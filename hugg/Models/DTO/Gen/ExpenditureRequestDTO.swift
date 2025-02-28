import Foundation

struct ExpenditureRequestDTO: Codable {
    enum Color: String, Codable {
        case blue = "BLUE"
        case green = "GREEN"
        case yellow = "YELLOW"
        case red = "RED"
    }

    var name: String?
    var color: Color?
    var amount: Int?

    public init(name: String? = nil, color: Color? = nil, amount: Int? = nil) {
        self.name = name
        self.color = color
        self.amount = amount
    }
}
