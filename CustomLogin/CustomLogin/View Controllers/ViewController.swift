//
//  ViewController.swift
//  CustomLogin
//
//  Created by 김호준 on 2020/07/15.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        Utilities.styleFilledButton(signupButton)
        Utilities.styleHollowButton(loginButton)
    }


}

