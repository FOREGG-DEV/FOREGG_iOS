enum dailyConditionType: String, Codable {
    case WORST
    case BAD
    case SOSO
    case GOOD
    case PERFECT
}

struct HomeResponseDTO: Codable {
    let userName: String
    let spouseName: String
    let todayDate: String
    let homeRecordResponseDTO: HomeRecordResponseDTO
    let ssn: String
    let todo: Bool
    let dailyConditionType: dailyConditionType
    let latestMedicalRecord: String
    let medicalRecordId: Int64
}
