//
//  LogInViewController.swift
//  Emotion App
//
//  Created by 김호준 on 2020/07/17.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Utilities.styleButton(loginButton)
    }

    
    func transitionToHome() {
        let homeTabBarController = storyboard?.instantiateViewController(identifier: Constants.ViewController.homeTabBar)
        view.window?.rootViewController = homeTabBarController
        view.window?.makeKeyAndVisible()
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: password) { (results, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                self.transitionToHome()
            }
        }
    }
}
