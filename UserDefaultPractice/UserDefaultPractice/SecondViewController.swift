//
//  SecondViewController.swift
//  UserDefaultPractice
//
//  Created by 김호준 on 2020/11/08.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textFiedl: UITextField!
    @IBOutlet weak var Label: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Label.text = UserDefaults.standard.string(forKey: "text")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.string(forKey: "texty") == nil {
            Label.text = "Nil"
        } 
    }
    @IBAction func storeTextField(_ sender: UIButton) {
        UserDefaults.standard.set(textFiedl.text, forKey: "text")
    }
}
