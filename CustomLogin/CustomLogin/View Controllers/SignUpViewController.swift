//
//  SignUpViewController.swift
//  CustomLogin
//
//  Created by 김호준 on 2020/07/15.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
    }
    
    func setupElements() {
        //hide Error Text
        errorText.alpha = 0
        
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    func validateFields() -> String? {
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please Fill in all Fields!"
        }
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "비밀번호를 8글자 이상이나 특수문자와 숫자를 포함해주세요!"
        }
        return nil
    }
    
    @IBAction func SignUpTapped(_ sender: Any) {
        
        let err = validateFields()
        if err != nil {
            //There is something wrong with fields
            showError(err!)
        } else {
            //Create User
            Auth.auth().createUser(withEmail: <#T##String#>, password: <#T##String#>) { (results, err) in
                if err != nil {
                    //There was an error
                    self.showError("Error Creating User")
                } else {
                    //UserCreated Successfully
                    
                }
            }
        }
    }
    
    func showError(_ message: String) {
        errorText.text = message
        errorText.alpha = 1
    }

}
