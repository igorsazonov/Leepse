//
//  EnterCodeScreenViewController.swift
//  Leepse
//
//  Created by Игорь Сазонов on 08.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit

class EnterCodeScreenViewController: UIViewController {

    let servicesUser = ServicesUser()
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var codeTextField: UITextField!
    
    @IBAction func submitTapped(_ sender: UIButton) {
        if codeTextField.text != "" {
            signInUser()
        } else {
            errorMessage.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            errorMessage.text = "Code was not entered. Please enter the code!"
        }
    }
    
    func signInUser() {
        let phoneNumber = phoneNumberSignIn
        let verificationCode = codeTextField.text ?? ""
        servicesUser.signInUser(user: UserSignIn(verification_code: verificationCode, phone: Phone(country_code: "7", phone_number: phoneNumber)), responseHandler: { (response) in
            if response.statusCode >= 200 && response.statusCode < 300 {
                DispatchQueue.main.async {
                    UserDefaults.standard.set(true, forKey: "ISUSERLOGGEDIN")
                    self.gotoLastScreenViewController()
                }
            }
        }, userHandler: {(user) in
            nameSignIn = user.user.username// сохранение в Realm
            let name = user.user.username
            //let id = String(user.user.id)
            UserDefaults.standard.set(name,forKey: "user")
        }, errorHandler: { (error) in
            DispatchQueue.main.async {
                self.errorMessage.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                self.errorMessage.text = error.errors.first // вывод ошибки на экран
            }
        })
    }
    
    func gotoLastScreenViewController() {
        let lastScreenViewController =  UIStoryboard(name: "Last", bundle: Bundle.main).instantiateViewController(withIdentifier: "lastVc") as! LastScreenViewController
        self.navigationController?.setViewControllers([lastScreenViewController], animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupLabelAndButton()
        codeTextField.defaultTextAttributes.updateValue(50.0, forKey: NSAttributedString.Key.kern)
    }
    
    func setupLabelAndButton() {
        phoneNumberLabel.text = phoneNumberSignIn
        errorMessage.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        submitButton.layer.cornerRadius = 16.7
        submitButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        submitButton.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.7176470588, blue: 0.3921568627, alpha: 1)
    }
    
    func setupNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
