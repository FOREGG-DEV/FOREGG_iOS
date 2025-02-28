import Foundation

// request -> var로 properties 두는 게 맞음
struct LedgerRequestDTO: Codable {
    var date: String?
    var count: Int?
    var content: String?
    var memo: String?
    var expenditureRequestDTOList: [ExpenditureRequestDTO]?

    init(date: String? = nil, count: Int? = nil, content: String? = nil, memo: String? = nil, expenditureRequestDTOList: [ExpenditureRequestDTO]? = nil) {
        self.date = date
        self.count = count
        self.content = content
        self.memo = memo
        self.expenditureRequestDTOList = expenditureRequestDTOList
    }
}
