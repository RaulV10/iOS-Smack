//
//  ChatVC.swift
//  smack-app
//
//  Created by Raul Ernesto Villarreal Sigala on 7/4/18.
//  Copyright © 2018 Raul Ernesto Villarreal Sigala. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var btnMenu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnMenu.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            }
        }
        
        MessageService.instance.findAllChannel { (success) in
            
        }
        
    }
    
}
