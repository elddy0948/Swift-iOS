//
//  ViewController.swift
//  Concurrency Practice
//
//  Created by 김호준 on 2020/08/04.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func dateChanged(_ sender: Any) {
    }
    @IBAction func buttonPressed(_ sender: Any) {
    }
    
    
    func buttonConfigure() {
        myButton.titleLabel?.text = "Calculate Primes"
    }
}

