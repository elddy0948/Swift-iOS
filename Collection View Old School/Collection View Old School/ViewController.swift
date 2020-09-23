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
    @IBAction func addEmoji(_ sender: Any) {
        
        //Data Source를 먼저 업데이트 해주고 Collection View를 수정해준다.
        let (category, randomEmoji) = Emoji.randomEmoji()
        dataSource.addEmoji(randomEmoji, to: category)
        
        let emojiCount = collectionView.numberOfItems(inSection: 0)
        let insertedIndex = IndexPath(item: emojiCount, section: 0)
        // CollectionView.reloadData를 사용해도 좋지만 insertItems를 활용해준다.
        collectionView.insertItems(at: [insertedIndex])
    }
}

