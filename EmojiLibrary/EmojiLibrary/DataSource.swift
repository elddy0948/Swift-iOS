//
//  DataSource.swift
//  EmojiLibrary
//
//  Created by 김호준 on 2020/09/24.
//

import UIKit

class DataSource: NSObject, UICollectionViewDataSource {
    
    let emoji = Emoji.shared
    
    //Section의 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return emoji.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //몇번 카테고리 인가?
        let category = emoji.sections[section]
        //그 카테고리의 emoji들
        let emoji = self.emoji.data[category]
        return emoji?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let emojiCell = collectionView.dequeueReusableCell(withReuseIdentifier: EmojiCell.reuseIdentifier, for: indexPath) as? EmojiCell else {
            fatalError(" Error While making emoji Cell ")
        }
        let category = emoji.sections[indexPath.section]
        let emoji = self.emoji.data[category]?[indexPath.item]
        
        emojiCell.emojiLabel.text = emoji
        
        return emojiCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let emojiHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: EmojiHeaderView.reuseIdentifier, for: indexPath) as? EmojiHeaderView else {fatalError("Can't make Emoji Header View")}
        
        let category = emoji.sections[indexPath.section]
        
        emojiHeader.emojiHeaderLabel.text = category.rawValue
        
        return emojiHeader
    }
}

extension DataSource {
    
    func addEmoji(_ emoji: String, to category: Emoji.Category) {
        guard var emojiData = self.emoji.data[category] else {return}
        emojiData.append(emoji)
        
        self.emoji.data.updateValue(emojiData, forKey: category)
    }
    
    func deleteEmoji(at indexPath: IndexPath) {
        let category = emoji.sections[indexPath.section]
        guard var emojiData = emoji.data[category] else {return}
        emojiData.remove(at: indexPath.item)
        
        emoji.data.updateValue(emojiData, forKey: category)
    }
    
    func deleteEmoji(at indexPaths: [IndexPath]) {
        for path in indexPaths {
            deleteEmoji(at: path)
        }
    }
    
}
