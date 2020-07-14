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

class SigninVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var handle: AuthStateDidChangeListenerHandle?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handle = Auth.auth().addStateDidChangeListener{ (auth, user) in
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }

    @IBAction func LoginPressed(_ sender: UIButton) {
        
        let userEmail = emailTextField.text!
        let userPassword = passwordTextField.text!
        
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { [weak self] authResult, error in
            guard self != nil else { return }
        }

        print("Login Pressed!")
        print("\(userEmail) \(userPassword)")
    }
    @IBAction func RegisterPressed(_ sender: UIButton) {
        print("Register Pressed!")
    }
}

