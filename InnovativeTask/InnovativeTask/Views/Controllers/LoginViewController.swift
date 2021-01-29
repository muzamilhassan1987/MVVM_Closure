//
//  LoginViewController.swift
//  InnovativeTask
//
//  Created by Muzamil Hassan on 24/01/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var lblErrorPassword: UILabel!
    @IBOutlet weak var lblErrorUserName: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    private var userViewModels = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblErrorPassword.isHidden = true
        self.lblErrorUserName.isHidden = true
        initializeViewModel()
    }
    func initializeViewModel(){
        
        self.userViewModels.bindUserViewModelToController = {[weak self] in
            self?.removeSpinner()
            let welcomeViewController = self?.storyboard!.instantiateViewController(withIdentifier: "WelcomViewController") as! WelcomViewController
            self?.navigationController!.pushViewController(welcomeViewController, animated: true)
        }
        self.userViewModels.bindUserNameError = {[weak self] (error) in
            print(error)
            self?.lblErrorPassword.isHidden = true
            self?.lblErrorUserName.isHidden = false
            self?.lblErrorUserName.text = error
        }
        self.userViewModels.bindPasswordError = {[weak self] (error) in
            print(error)
            self?.lblErrorPassword.isHidden = false
            self?.lblErrorUserName.isHidden = true
            self?.lblErrorPassword.text = error
        }
        self.userViewModels.bindApiError = {[weak self] (error) in
            print(error)
            self?.removeSpinner()
            self?.showAlert(title: "Error", message: error)
        }
    }
    
    
    
    @IBAction func loginAction(_ sender: Any) {
        
        self.view.endEditing(true)
        guard let name = txtUserName.text else {
            return
        }
        guard let pass = txtPassword.text else {
            return
        }
        self.userViewModels.updateCredentials(username: name, password: pass)
        switch userViewModels.credentialsInput() {
        case .Correct:
            login()
        case .Incorrect:
            return
        }
    }
    func login() {
        self.showSpinner()
        self.lblErrorPassword.isHidden = true
        self.lblErrorUserName.isHidden = true
        self.userViewModels.callFuncToGetUserData()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
}
