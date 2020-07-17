//
//  SignUpViewController.swift
//  Emotion App
//
//  Created by 김호준 on 2020/07/17.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

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
        print("lastname : \(lastname) \n firstname : \(firstname) \n email : \(email) \n password : \(password) \n birthdate : \(birth)" )
    }
    
    
}
