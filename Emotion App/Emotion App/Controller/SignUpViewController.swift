//
//  SignUpViewController.swift
//  Emotion App
//
//  Created by 김호준 on 2020/07/17.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var lastnameTextField: UITextField! //
    @IBOutlet weak var firstnameTextField: UITextField! //이름
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    
    var lastname = ""
    var firstname = ""
    var email = ""
    var password = ""
    var birth = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        Utilities.styleButton(signupButton)
    }
    func cleanedTextField() {
        lastname = lastnameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        firstname = firstnameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
    }
    @IBAction func birthdateChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        birth = dateFormatter.string(from: birthDatePicker.date)
    }
    @IBAction func signupButtonPressed(_ sender: UIButton) {
        cleanedTextField()
        let err = validateFields()
        if err == nil {
            //Create User
            Auth.auth().createUser(withEmail: email, password: password) { (results, errors) in
                if errors == nil {
                    //회원가입 성공적
                    let db = Firestore.firestore()
                    db.collection(Constants.Firebase.userCollection).addDocument(data: [Constants.Firebase.firstName : self.firstname, Constants.Firebase.lastName : self.lastname, Constants.Firebase.uid : results!.user.uid]) { (errors) in
                        if errors == nil {
                            
                        }
                    }
                    self.transitionToHome()
                }
            }
        }
        print("lastname : \(lastname) \n firstname : \(firstname) \n email : \(email) \n password : \(password) \n birthdate : \(birth)" )
    }
    
    func validateFields() -> String? {
        //모든 칸이 채워졌는지 확인.
        if firstnameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)  == "" ||
            lastnameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "모든 칸을 채워주세요!"
        }
        return nil
    }
    
    func transitionToHome() {
        let homeTabBarController = storyboard?.instantiateViewController(identifier: Constants.ViewController.homeTabBar)
        view.window?.rootViewController = homeTabBarController
        view.window?.makeKeyAndVisible()
    }
}
