//
//  EnterCodeSignUpViewController.swift
//  Leepse
//
//  Created by Игорь Сазонов on 09.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit

class EnterCodeSignUpViewController: UIViewController {

    let userNameViewController = UserNameViewController()
    let phoneNumberSignUpViewController = PhoneNumberSignUpViewController()
    let servicesUser = ServicesUser()
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var codeTextField: UITextField!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func submitTapped(_ sender: UIButton) {
        if codeTextField.text != "" {
            registrationUser()
        } else {
            messageLabel.text = "Code was not entered. Please enter the code!"
        }
    }
    
    func registrationUser() {
        let userName = userNameGlobalVar
        let phoneNumber = phoneNumberSignUp
        let verificationCode = codeTextField.text ?? ""
        servicesUser.registationUser(user: UserSignUp(verification_code: verificationCode, phone: Phone(country_code: "7", phone_number: phoneNumber), user: User(username: userName)), responseHandler: { (response) in
            if response.statusCode >= 200 && response.statusCode < 300 {
                DispatchQueue.main.async {
                    UserDefaults.standard.set(true, forKey: "IsUserLoggedIn")
                    self.gotoLastScreenViewController()
                }
            }
        }, userHandler: {(user) in
            let name = user.user.username
            UserDefaults.standard.set(name,forKey: "user") // сохранение локально
        }, errorHandler: { (error) in
            DispatchQueue.main.async {
                self.messageLabel.text = error.errors.first // вывод ошибки на экран
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabelAndButton()
        codeTextField.defaultTextAttributes.updateValue(50.0, forKey: NSAttributedString.Key.kern)
    }
    
    func setupLabelAndButton() {
        self.numberLabel.text = phoneNumberSignUp
        self.numberLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        messageLabel.text = ""
        messageLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        submitButton.layer.cornerRadius = 16.7
        submitButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        submitButton.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.7176470588, blue: 0.3921568627, alpha: 1)
    }
    
    func gotoLastScreenViewController() {
        let lastScreenViewController = UIStoryboard(name: "Last", bundle: .main).instantiateViewController(withIdentifier: "lastVc") as! LastScreenViewController
        self.navigationController?.setViewControllers([lastScreenViewController], animated: true)
    }
}
