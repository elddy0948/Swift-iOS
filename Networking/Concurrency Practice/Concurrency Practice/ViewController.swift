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
    
    var calculationDisabled = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonConfigure()
    }


    @IBAction func dateChanged(_ sender: Any) {
    }
    @IBAction func buttonPressed(_ sender: Any) {
        myButton.isEnabled = false
        DispatchQueue.global(qos: .userInitiated).async {
            for number in 0...1_000_000 {
                let isPrimeNumber = self.isPrime(number: number)
                print("\(number) is Prime : \(isPrimeNumber)")
            }
            self.myButton.isEnabled = true
        }
    }
    
    
    func buttonConfigure() {
        myButton.titleLabel?.text = "Calculate Primes"
        myButton.isEnabled = true
    }
    
    func isPrime(number: Int) -> Bool {
        if number <= 1 { return false }
        if number <= 3 {return true }
        
        var i = 2
        while i * i <= number {
            if number % i == 0 {
                return false
            }
            i = i + 2
        }
        return true
    }
}

