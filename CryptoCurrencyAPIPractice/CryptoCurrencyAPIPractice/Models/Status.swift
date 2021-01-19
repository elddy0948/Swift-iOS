import Foundation

struct Status: Codable {
    let timeStamp: String
    let errorCode: Int?
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case timeStamp = "timestamp"
        case errorCode = "error_code"
        case errorMessage = "error_message"
    }
}
