// JWT 관리용 class
import Foundation

class TokenManager {
    // singleton
    static let shared = TokenManager()
    private init() {}
    
    private var cachedToken: String?
    
    var jwtToken: String? {
        if let token = cachedToken {
            return token
        }
        // get from userDefaults
        cachedToken = UserDefaults.standard.string(forKey: "jwtToken")
        return cachedToken
    }
    
    func updateToken(_ token: String) {
        cachedToken = token
        UserDefaults.standard.set(token, forKey: "jwtToken")
    }
}
