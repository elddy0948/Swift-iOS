//
//  EmojiDetailViewController.swift
//  CollectionViewOldSchool
//
//  Created by 김호준 on 2020/09/15.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

class EmojiDetailController: UIViewController {
  
  var emoji: String? {
    didSet {
      if let label = textLabel {
        label.text = emoji
      }
    }
  }
  
  @IBOutlet weak var textLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    textLabel.text = emoji
  }
}
