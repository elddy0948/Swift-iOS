//
//  ViewController.swift
//  CollectionImage
//
//  Created by 김호준 on 2020/09/16.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>!
    var pickedImage: [UIImage]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.collectionViewLayout = collectionLayoutConfigure()
    }

    
    func collectionLayoutConfigure() -> UICollectionViewLayout {
        //item size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        //group size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.2))
        let group = NSCollectionLayoutGroup(layoutSize: groupSize)
        
        //section size
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, number) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.reuseIdentifier, for: indexPath) as? ImageCell else {fatalError("Can't make Cell")}
//            cell.imageCell.image = self.pickedImage?[indexPath.row]
            return cell
        })
        var initialSnapShot = NSDiffableDataSourceSnapshot<Section, Int>()
        initialSnapShot.appendSections([.main])
        initialSnapShot.appendItems(Array(1...100))
        
        dataSource.apply(initialSnapShot, animatingDifferences: false)
    }
}

