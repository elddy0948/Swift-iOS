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
            //Create cleaned versions of the data
            
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Create User
            Auth.auth().createUser(withEmail: email, password: password) { (results, err) in
                if err != nil {
                    //There was an error
                    self.showError("Error Creating User")
                } else {
                    //UserCreated Successfully
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["first_name": firstName, "last_name": lastName, "uid": results!.user.uid]) { (error) in
                        if error != nil {
                            self.showError("Error Saving User Data")
                        }
                    }
                    self.transitionToHome()
                }
            }
        }
    }
    
    func showError(_ message: String) {
        errorText.text = message
        errorText.alpha = 1
    }
    
    func transitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }

}
