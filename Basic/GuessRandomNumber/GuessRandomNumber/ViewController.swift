//
//  ViewController.swift
//  GuessRandomNumber
//
//  Created by 김호준 on 2020/10/16.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    // slider, minLabel, maxLabel, roundLabel, numberLabel
    @IBOutlet var slider: UISlider!
    @IBOutlet var minLabel: UILabel!
    @IBOutlet var maxLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    
    private var randomNumber: Int = 0
    private var round: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }

    
    //MARK: - IBActions
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        numberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func didTapRestartButton(_ sender: UIButton) {
        reset()
    }
    
    @IBAction func didTapCheckButton(_ sender: UIButton) {
        // Check it's right Number
        let userNumber = Int(slider.value)
        round = round + 1
        if userNumber == randomNumber {
            // Found the number!!
            showAlert(message: "You Win!")
            reset()
        }
        else if round >= 5 {
            // user can't find number T0T
            showAlert(message: "You Loose ToT")
            reset()
        }
        else if userNumber < randomNumber {
            // Change minLabel to userNumber
            minLabel.text = "\(userNumber)"
            slider.minimumValue = Float(userNumber)
        }
        else if userNumber > randomNumber {
            //Change maxLabel to userNumber
            maxLabel.text = "\(userNumber)"
            slider.maximumValue = Float(userNumber)
            
        }
        roundLabel.text = "\(round) / 5"
    }
    
    //MARK: - private
    private func createRandomNumber() -> Int{
        let randNumber = Int.random(in: 0...30)
        print(randNumber)
        return randNumber
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func reset() {
        slider.minimumValue = 0.0
        slider.maximumValue = 30.0
        minLabel.text = "0"
        maxLabel.text = "30"
        randomNumber = createRandomNumber()
        slider.value = 15.0
        round = 0
        roundLabel.text = "0 / 5"
        numberLabel.text = "15"
    }
}

