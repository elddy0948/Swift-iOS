import UIKit

struct Book: Hashable {
    let title: String
    let author: String
    var review: String?
    var readMe: Bool
    
    var image: UIImage {
        Library.loadImage(forBook: self) ?? LibrarySymbol.letterSquare(letter: title.first).image
    }
}
