import Foundation

struct CurrencyData: Codable {
    let status: Status?
    let cryptoData: [CryptoCurrency]?
    
    enum CodingKeys: String, CodingKey {
        case cryptoData = "data"
        case status
    }
}
