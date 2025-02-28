import Foundation

struct HomeResponseDTO: Codable {
    enum DailyConditionType: String, Codable {
        case mad = "MAD"
        case sad = "SAD"
        case anxious = "ANXIOUS"
        case happy = "HAPPY"
        case love = "LOVE"
    }

    var userName: String?
    var spouseName: String?
    var todayDate: String?
    var homeRecordResponseDTO: [HomeRecordResponseDTO]?
    var ssn: String?
    var todo: Bool?
    var dailyConditionType: DailyConditionType?
    var dailyContent: String?
    var latestMedicalRecord: String?
    var medicalRecordId: Int64?

    init(userName: String? = nil, spouseName: String? = nil, todayDate: String? = nil, homeRecordResponseDTO: [HomeRecordResponseDTO]? = nil, ssn: String? = nil, todo: Bool? = nil, dailyConditionType: DailyConditionType? = nil, dailyContent: String? = nil, latestMedicalRecord: String? = nil, medicalRecordId: Int64? = nil) {
        self.userName = userName
        self.spouseName = spouseName
        self.todayDate = todayDate
        self.homeRecordResponseDTO = homeRecordResponseDTO
        self.ssn = ssn
        self.todo = todo
        self.dailyConditionType = dailyConditionType
        self.dailyContent = dailyContent
        self.latestMedicalRecord = latestMedicalRecord
        self.medicalRecordId = medicalRecordId
    }
}
