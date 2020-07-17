//
//  ViewController.swift
//  Emotion App
//
//  Created by 김호준 on 2020/07/08.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class FirstViewController: UIViewController {
    
    @IBOutlet weak var gotoSignUpButton: UIButton!
    @IBOutlet weak var gotoLogInButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Utilities.styleButton(gotoSignUpButton)
        Utilities.styleButton(gotoLogInButton)
    }
    
}

