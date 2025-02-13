/// Screen 비동기처리 상태 Enum
/// 비동기처리 시 에러 및 로딩 핸들링을 위한 Enum입니다.
enum ViewStatus {
    /// 비동기 처리를 진행 중인 상태
    case loading
    /// 비동기 처리가 성공한 상태
    case success
    /// 비동기 처리가 실패한 상태
    ///
    /// 실패 시 비동기 처리 코드에서 error 문자열을 담아서 리턴한다.
    case failure(String)
}
