//
//  CreateAccountVC.swift
//  smack-app
//
//  Created by Raul Ernesto Villarreal Sigala on 7/5/18.
//  Copyright © 2018 Raul Ernesto Villarreal Sigala. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var imgUser: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnClosePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func btnCreateAccountPressed(_ sender: Any) {
        guard let email = txtEmail.text , txtEmail.text != "" else { return }
        guard let password = txtPassword.text , txtPassword.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        print("logged user!", AuthService.instance.authToken)
                    }
                })
            }
        }
    }
    
    @IBAction func btnPickAvatarPressed(_ sender: Any) {
        
    }
    
    @IBAction func btnPickBGColorPressed(_ sender: Any) {
        
    }
    
}
