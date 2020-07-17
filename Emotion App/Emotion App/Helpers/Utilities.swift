//
//  Utilities.swift
//  Emotion App
//
//  Created by 김호준 on 2020/07/17.
//  Copyright © 2020 김호준. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    static func styleButton(_ button: UIButton) {
        button.layer.cornerRadius = 20.0
        button.tintColor = UIColor.black
        button.backgroundColor = UIColor.white
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 24.0)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24.0)
    }
}
