//
//  ViewController.swift
//  Local Notifications Practice
//
//  Created by 김호준 on 2020/07/19.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//       Step 1
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
        }
//       Step 2
        let content = UNMutableNotificationContent()
        content.title = "This is title"
        content.body = "Hello!"
        
    }


    
}

