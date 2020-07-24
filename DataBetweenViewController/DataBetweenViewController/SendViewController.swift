//
//  SendViewController.swift
//  DataBetweenViewController
//
//  Created by 김호준 on 2020/07/24.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

protocol SendDataDelegate {
    func SendData(_ data: String)
}

class SendViewController: UIViewController {

    var delegate: SendDataDelegate?
    
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sendPressed(_ sender: UIButton) {
        if let data = myTextField.text{
            delegate?.SendData(data)
            dismiss(animated: true) {}
        }
    }
}
