//
//  EmojiDetailController.swift
//  Collection View Old School
//
//  Created by 김호준 on 2020/09/20.
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

        // Do any additional setup after loading the view.
        
        textLabel.text = emoji
        
    }
}
