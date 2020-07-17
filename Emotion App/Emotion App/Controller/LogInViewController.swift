//
//  LogInViewController.swift
//  Emotion App
//
//  Created by 김호준 on 2020/07/17.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Utilities.styleButton(loginButton)
    }

}
