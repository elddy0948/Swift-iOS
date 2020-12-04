//
//  LongPressViewController.swift
//  GestureRecognizerPractice
//
//  Created by 김호준 on 2020/12/05.
//

import UIKit

class LongPressViewController: UIViewController {

    @IBOutlet var longPressView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        longPress.numberOfTapsRequired = 1
        longPress.minimumPressDuration = 0.01
        self.longPressView.addGestureRecognizer(longPress)
    }
}
extension LongPressViewController {
    @objc func handleLongPress(_ sender: UILongPressGestureRecognizer) {
        print(sender.state)
    }
}
