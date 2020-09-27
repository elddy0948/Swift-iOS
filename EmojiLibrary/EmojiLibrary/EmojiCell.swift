//
//  EmojiCell.swift
//  EmojiLibrary
//
//  Created by 김호준 on 2020/09/24.
//

import UIKit

class EmojiCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: EmojiCell.self)
    
    @IBOutlet weak var emojiLabel: UILabel!
    
    var isEditing: Bool = false
    
    override var isSelected: Bool {
        didSet {
            if isEditing {
                //Edit중이면
                contentView.backgroundColor = isSelected ? UIColor.systemRed.withAlphaComponent(0.5) : UIColor.systemGray
            } else {
                contentView.backgroundColor = UIColor.systemGray
            }
        }
    }
}
