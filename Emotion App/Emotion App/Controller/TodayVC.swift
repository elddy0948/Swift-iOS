//
//  TodayVC.swift
//  Emotion App
//
//  Created by 김호준 on 2020/07/08.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

class TodayVC: UIViewController {

    @IBOutlet weak var todayDate: UILabel!
    @IBOutlet weak var howWasYour: UILabel!
    
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var sosoButton: UIButton!
    @IBOutlet weak var notbadButton: UIButton!
    @IBOutlet weak var happyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todayDateconfigure()
        howWasYourConfigure()
        feelingButtonConfigure()
    }
    func todayDateconfigure() {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        let formattedDate: String? = format.string(from: date)
        todayDate.text = formattedDate ?? ""
        todayDate.textColor = UIColor.white
    }
    func howWasYourConfigure() {
        howWasYour.text = "How was your Today?"
        howWasYour.textColor = UIColor.white
    }
    func feelingButtonConfigure() {
        badButton.setTitle("BAD", for: .normal)
        sadButton.setTitle("SAD", for: .normal)
        sosoButton.setTitle("SOSO", for: .normal)
        notbadButton.setTitle("NOT BAD", for: .normal)
        happyButton.setTitle("HAPPY", for: .normal)
        
    }
}
