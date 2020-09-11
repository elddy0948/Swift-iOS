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

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //CollectionView Layout 설정
        collectionView.collectionViewLayout = collectionLayoutConfigure()
        
    }
    
    func collectionLayoutConfigure() -> UICollectionViewLayout{
        //item의 사이즈
        //width == parent width
        //height == parent height
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //group의 사이즈
        //width == parent width
        //height == parent height
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //Section
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }

}

