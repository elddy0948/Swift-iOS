//
//  ViewController.swift
//  Collection View Practice
//
//  Created by 김호준 on 2020/09/11.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

//Section안에 Group이 있고, Group안에 Item이 있다.

class ViewController: UIViewController {
    enum Section {
        case main
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //CollectionView Layout 설정
        collectionView.collectionViewLayout = collectionLayoutConfigure()
        
        //DataSouce 호출
        configureDataSource()
    }
    
    func collectionLayoutConfigure() -> UICollectionViewLayout{
        //item의 사이즈
        //width == parent width
        //height == parent height
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        //group의 사이즈
        //width == parent width
        //height == parent height
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //Section
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, number) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCell.reuseIdentifier, for: indexPath) as? NumberCell else { fatalError("Cannot make New Cell") }
            cell.cellLabel.text = number.description
            return cell
        })
        
        var initialSnapShot = NSDiffableDataSourceSnapshot<Section, Int>()
        initialSnapShot.appendSections([.main])
        initialSnapShot.appendItems(Array(1...100))
        
        dataSource.apply(initialSnapShot, animatingDifferences: false)
    }
}

