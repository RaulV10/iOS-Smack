//
//  Constants.swift
//  smack-app
//
//  Created by Raul Ernesto Villarreal Sigala on 7/4/18.
//  Copyright © 2018 Raul Ernesto Villarreal Sigala. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants
let BASE_URL = "https://ios-smack-app-raulv10.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"

// Seagues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
