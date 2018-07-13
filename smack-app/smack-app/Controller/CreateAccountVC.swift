//
//  CreateAccountVC.swift
//  smack-app
//
//  Created by Raul Ernesto Villarreal Sigala on 7/5/18.
//  Copyright © 2018 Raul Ernesto Villarreal Sigala. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    // Outlets
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var imgUser: UIImageView!
    
    // Defaults Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnClosePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func btnCreateAccountPressed(_ sender: Any) {
        guard let name = txtUsername.text, txtUsername.text != "" else { return }
        guard let email = txtEmail.text , txtEmail.text != "" else { return }
        guard let password = txtPassword.text , txtPassword.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
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
