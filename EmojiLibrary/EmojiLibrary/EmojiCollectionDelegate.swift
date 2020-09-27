//
//  EmojiCollectionDelegate.swift
//  EmojiLibrary
//
//  Created by 김호준 on 2020/09/24.
//

import UIKit

class EmojiCollectionDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    let numberOfItemPerRow: CGFloat
    let interItemSpacing: CGFloat
    
    init(numberOfItemPerRow: CGFloat, interItemSpacing: CGFloat) {
        self.numberOfItemPerRow = numberOfItemPerRow
        self.interItemSpacing = interItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Item의 크기를 지정해준다.
        let maxWidth = UIScreen.main.bounds.width
        let totalSpacing = interItemSpacing * numberOfItemPerRow
        let itemWidth = ( maxWidth - totalSpacing ) / numberOfItemPerRow
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // section내부에서의 공간을 지정해준다.
        return interItemSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // Section끼리의 공간을 지정해준다.
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: interItemSpacing / 2, right: 0)
        } else {
            return UIEdgeInsets(top: interItemSpacing / 2, left: 0, bottom: interItemSpacing / 2, right: 0)
        }
    }
    
}
