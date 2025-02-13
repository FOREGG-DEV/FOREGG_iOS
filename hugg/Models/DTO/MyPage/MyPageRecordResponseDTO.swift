// TODO: 복용량 사용하는지 체크
struct MyPageRecordResponseDTO: Codable {
    let id: Int
    let date: String
    let startDate: String
    let endDate: String
    let repeatDays: String
    let name: String
    // 복용량
//    let dose: String
}
