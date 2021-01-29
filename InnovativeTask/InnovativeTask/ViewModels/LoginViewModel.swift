//
//  UserViewModel.swift
//  InnovativeTask
//
//  Created by Muzamil Hassan on 25/01/2021.
//

import Foundation
import UIKit

class LoginViewModel : NSObject {
    
    //private var apiService : WebService!
    private var username = ""
    private var password = ""
    private var credentials = Credentials() {
        didSet {
            username = credentials.username
            password = credentials.password
        }
    }
    var bindUserViewModelToController : (() -> Void) = { }
    var bindUserNameError : ((_ error : String) -> Void) = {_ in }
    var bindPasswordError : ((_ error : String) -> Void) = {_ in }
    var bindApiError : ((_ error : String) -> Void) = {_ in }
    override init() {
        super.init()
        
    }
    func callFuncToGetUserData() {
        
        let parameterDictionary = ["username" : username, "password" : password]
        print(parameterDictionary)
        WebService.shared.authenticateUser(param: parameterDictionary) { (user, error) in
        
            if let err = error {
                print("Failed to fetch products:", err)
                switch err {
                case .apiFailure(let error), .unAuthorizeError(let error):
                    self.bindApiError(error)
                    print(error)
                    break
                }
                return
            }
            var userData = user
            userData?.userName = self.username
            userData?.password = self.password
            CurrentUser.loggedInUser = userData
            self.bindUserViewModelToController()
        }
    }
    
    
    //Here we update our model
        func updateCredentials(username: String, password: String, otp: String? = nil) {
            credentials.username = username
            credentials.password = password
        }
    func credentialsInput() -> CredentialsInputStatus {
            if username.isEmpty {
                self.bindUserNameError("Username field is empty.")
                return .Incorrect
            }
            if password.isEmpty {
                self.bindPasswordError("Password field is empty.")
                return .Incorrect
            }
            return .Correct
        }
}
extension LoginViewModel {
    enum CredentialsInputStatus {
        case Correct
        case Incorrect
    }
}
