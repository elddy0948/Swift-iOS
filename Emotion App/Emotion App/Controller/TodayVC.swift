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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todayDateconfigure()
        howWasYourConfigure()
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
}
