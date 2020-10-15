//
//  ImageCell.swift
//  CollectionImage
//
//  Created by 김호준 on 2020/09/16.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: ImageCell.self)
    
    @IBOutlet weak var imageCell: UIImageView!
}
