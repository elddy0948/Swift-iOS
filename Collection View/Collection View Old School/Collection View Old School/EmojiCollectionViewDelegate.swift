import UIKit

class EmojiCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    let numberOfItemPerRow: CGFloat
    let interItemSpacing: CGFloat
    
    init(numberOfItemPerRow: CGFloat, interItemSpacing: CGFloat) {
        self.numberOfItemPerRow = numberOfItemPerRow
        self.interItemSpacing = interItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxWidth = UIScreen.main.bounds.width
        let totalSpacing = interItemSpacing * numberOfItemPerRow
        let itemWidth = (maxWidth - totalSpacing) / numberOfItemPerRow
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 0 {
            // 첫번째 세션일 때는 아래만 주면 된다.
            return UIEdgeInsets(top: 0, left: 0, bottom: interItemSpacing / 2, right: 0)
        } else {
            // 두번째 세션 부터는 위 아래 둘다 필요햐다.
            return UIEdgeInsets(top: interItemSpacing / 2, left: 0, bottom: interItemSpacing / 2, right: 0)
        }
    }
}
