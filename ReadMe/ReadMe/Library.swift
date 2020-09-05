import UIKit

// MARK:- Reusable SFSymbol Images
enum LibrarySymbol {
  case bookmark
  case bookmarkFill
  case book
  case letterSquare(letter: Character?)
  
  var image: UIImage {
    let imageName: String
    switch self {
    case .bookmark, .book:
      imageName = "\(self)"
    case .bookmarkFill:
      imageName = "bookmark.fill"
    case .letterSquare(let letter):
      guard let letter = letter?.lowercased(),
      let image = UIImage(systemName: "\(letter).square")
        else {
          imageName = "square"
          break
      }
      return image
    }
    return UIImage(systemName: imageName)!
  }
}

// MARK:- Library
enum Library {
  static let books: [Book] = [
    Book(title: "Ein Neues Land", author: "Shaun Tan"),
    Book(title: "Bosch", author: "Laurinda Dixon"),
    Book(title: "Dare to Lead", author: "Brené Brown"),
    Book(title: "Blasting for Optimum Health Recipe Book", author: "NutriBullet"),
    Book(title: "Drinking with the Saints", author: "Michael P. Foley"),
    Book(title: "A Guide to Tea", author: "Adagio Teas"),
    Book(title: "The Life and Complete Work of Francisco Goya", author: "P. Gassier & J Wilson"),
    Book(title: "Lady Cottington's Pressed Fairy Book", author: "Lady Cottington"),
    Book(title: "How to Draw Cats", author: "Janet Rancan"),
    Book(title: "Drawing People", author: "Barbara Bradley"),
    Book(title: "What to Say When You Talk to Yourself", author: "Shad Helmstetter")
  ]
}
