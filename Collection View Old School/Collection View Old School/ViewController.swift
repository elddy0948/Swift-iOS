//
//  ViewController.swift
//  Collection View Old School
//
//  Created by 김호준 on 2020/09/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    let dataSource = DataSource()
    let delegate = EmojiCollectionViewDelegate(numberOfItemPerRow: 6, interItemSpacing: 8)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        
        //여러개의 Emoji를 선택할 수 있게 함.
        collectionView.allowsMultipleSelection = true
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        deleteButton.isEnabled = isEditing
        addButton.isEnabled = !isEditing
        
        collectionView.indexPathsForVisibleItems.forEach {
            guard let emojiCell = collectionView.cellForItem(at: $0) as? EmojiCell else {return}
            emojiCell.isEditing = editing
        }
        if !isEditing {
            collectionView.indexPathsForVisibleItems.compactMap({$0}).forEach {
                collectionView.deselectItem(at: $0, animated: true)
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if isEditing && identifier == "showEmojiDetail" {
            return false
        }
        return true
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
    
    @IBAction func deleteEmoji(_ sender: Any) {
        
        guard let selectedIndices = collectionView.indexPathsForSelectedItems else {return}
        
        let sectionsToDelete = Set(selectedIndices.map({ $0.section }))
        sectionsToDelete.forEach { section in
            let indexPathsForSection = selectedIndices.filter({ $0.section == section })
            let sortedIndexPaths = indexPathsForSection.sorted(by: {$0.item > $1.item})
            
            dataSource.deleteEmoji(at: sortedIndexPaths)
            collectionView.deleteItems(at: sortedIndexPaths)
        }
    }
    
}
