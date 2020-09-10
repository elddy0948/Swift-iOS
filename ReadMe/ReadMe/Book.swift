import UIKit

struct Book: Hashable {
    let title: String
    let author: String
    var review: String?
    var readMe: Bool
    
    var image: UIImage?
    
    static var mockBook = Book(title: "", author: "", readMe: true)
}


extension Book: Codable {
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case review
        case readMe
    }
}
