import UIKit

struct Book {
    let title: String
    let author: String
    
    var image: UIImage {
        LibrarySymbol.letterSquare(letter: title.first).image
    }
}
