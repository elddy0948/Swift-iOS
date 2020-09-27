//
//  EmojiDetailController.swift
//  EmojiLibrary
//
//  Created by 김호준 on 2020/09/25.
//

import UIKit

class EmojiDetailController: UIViewController {

    @IBOutlet weak var emojiLabel: UILabel!
    
    var emoji: String? {
        didSet {
            if let label = emojiLabel {
                label.text = emoji
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        emojiLabel.text = emoji
    }

}
