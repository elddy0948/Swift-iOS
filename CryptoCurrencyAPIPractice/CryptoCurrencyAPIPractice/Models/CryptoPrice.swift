import Foundation

struct CryptoPrice: Codable {
    let price: Double?
    let volume: Double?
    let percentChangeOneDay: Double?
    
    enum CodingKeys: String, CodingKey {
        case percentChangeOneDay = "percent_change_24h"
        case price, volume
    }
}
