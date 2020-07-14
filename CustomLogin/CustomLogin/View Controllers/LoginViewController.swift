//
//  LoginViewController.swift
//  CustomLogin
//
//  Created by 김호준 on 2020/07/15.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var errorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LogInTapped(_ sender: Any) {
    }
    
}
