//
//  ReceiveViewController.swift
//  DataBetweenViewController
//
//  Created by 김호준 on 2020/07/24.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

class ReceiveViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show" {
            let viewController: SendViewController = segue.destination as! SendViewController
            viewController.delegate = self
        }
    }
}

//프로토콜 채택
extension ReceiveViewController: SendDataDelegate {
    //준수
    func SendData(_ data: String) {
        myLabel.text = data
    }
}
