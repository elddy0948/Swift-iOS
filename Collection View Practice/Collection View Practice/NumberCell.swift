//
//  NumberCell.swift
//  Collection View Practice
//
//  Created by 김호준 on 2020/09/11.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

class NumberCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: NumberCell.self)
    
    @IBOutlet weak var cellLabel: UILabel!
}
