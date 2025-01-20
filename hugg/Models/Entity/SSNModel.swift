import Foundation

struct SSNModel {
    // SSN을 자리별로 저장하는 배열
    var ssnDigits: [String] = Array(repeating: "", count: 7)

    // 전체 SSN을 조합하여 반환
    var fullSSN: String {
        ssnDigits.joined()
    }

    // 유효성 검사
    var isValid: Bool {
        return fullSSN.count == 7 && fullSSN.allSatisfy { $0.isNumber }
    }

    // SSN 전체를 업데이트하는 메서드
    mutating func updateSSN(with newSSN: String) {
        let filteredSSN = newSSN.filter { $0.isNumber } // 숫자만 허용
//        let currentLength = filteredSSN.count

        // 1. 배열을 초기화 (빈 문자열로 채우기)
        ssnDigits = Array(repeating: "", count: 7)

        // 2. 새로운 값으로 배열을 동기화
        for (index, char) in filteredSSN.prefix(7).enumerated() {
            ssnDigits[index] = String(char)
        }

        // 3. Debugging 출력 (Optional)
        print("Updated ssnDigits: \(ssnDigits)")
    }
}
