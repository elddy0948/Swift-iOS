//
//  ViewController.swift
//  EmojiLibrary
//
//  Created by 김호준 on 2020/09/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emojiCollectionView: UICollectionView!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    let dataSource = DataSource()
    let delegate = EmojiCollectionDelegate(numberOfItemPerRow: 6, interItemSpacing: 8)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emojiCollectionView.dataSource = dataSource
        emojiCollectionView.delegate = delegate
        
        //Edit
        emojiCollectionView.allowsMultipleSelection = true
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    //Edit Mode!
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        deleteButton.isEnabled = isEditing
        addButton.isEnabled = !isEditing
        
        emojiCollectionView.indexPathsForVisibleItems.forEach {
            guard let emojiCell = emojiCollectionView.cellForItem(at: $0) as? EmojiCell else {return}
            emojiCell.isEditing = editing
        }
        
        //Edit모드가 아니면 선택했던걸 다시 원래대로 돌린다.
        if !isEditing {
            emojiCollectionView.indexPathsForVisibleItems.compactMap({$0}).forEach {
                emojiCollectionView.deselectItem(at: $0, animated: true)
            }
        }
    }
    
    //Emoji 선택했을 때 Segue를 실행해야 하는가?
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if isEditing && identifier == "showEmojiDetail" {
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showEmojiDetail",
              let emojiCell = sender as? EmojiCell,
              let emojiDetailView = segue.destination as? EmojiDetailController,
              let indexPath = emojiCollectionView.indexPath(for: emojiCell),
              let emoji = Emoji.shared.emoji(at: indexPath) else {
            fatalError("Error to go Emoji Detail View")
        }
        emojiDetailView.emoji = emoji
    }
    @IBAction func addButtonPressed(_ sender: Any) {
        
        let (category, randomEmoji) = Emoji.randomEmoji()
        dataSource.addEmoji(randomEmoji, to: category)
        
        let emojiCount = emojiCollectionView.numberOfItems(inSection: 0)
        let insertedIndex = IndexPath(item: emojiCount, section: 0)
        emojiCollectionView.insertItems(at: [insertedIndex])
        
    }
    
    @IBAction func removeButtonPressed(_ sender: Any) {
        guard let selectedItems = emojiCollectionView.indexPathsForSelectedItems else {return}
        
        let sectionsToDelete = Set(selectedItems.map({$0.section}))
        sectionsToDelete.forEach({ section in
            let indexPathsForSection = selectedItems.filter({ $0.section == section })
            let sortedIndexPaths = indexPathsForSection.sorted(by: {$0.item > $1.item})
            
            dataSource.deleteEmoji(at: sortedIndexPaths)
            emojiCollectionView.deleteItems(at: sortedIndexPaths)
        })
    }
}

