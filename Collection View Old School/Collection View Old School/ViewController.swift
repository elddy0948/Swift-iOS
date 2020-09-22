//
//  ViewController.swift
//  Collection View Old School
//
//  Created by 김호준 on 2020/09/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let dataSource = DataSource()
    let delegate = EmojiCollectionViewDelegate(numberOfItemPerRow: 6, interItemSpacing: 8)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showEmojiDetail",
              let emojiCell = sender as? EmojiCell,
              let emojiDetailController = segue.destination as? EmojiDetailController,
              let indexPath = collectionView.indexPath(for: emojiCell),
              let emoji = Emoji.shared.emoji(at: indexPath)
        else {
            fatalError("Can't go Emoji Detail Controller")
        }
        
        emojiDetailController.emoji = emoji
    }
}
