//
//  EmojiCell.swift
//  CollectionViewOldSchool
//
//  Created by 김호준 on 2020/09/15.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

class EmojiCell: UICollectionViewCell {
  static let reuseIdentifier = String(describing: EmojiCell.self)
    
  @IBOutlet weak var emojiLabel: UILabel!
}
