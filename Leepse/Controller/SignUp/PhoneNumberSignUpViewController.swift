//
//  PhoneNumberSignUpViewController.swift
//  Leepse
//
//  Created by Игорь Сазонов on 09.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit
var phoneNumberGlobalVar = ""

class PhoneNumberSignUpViewController: UIViewController {
    
    let servicesUser = ServicesUser()

    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBAction func submitTapped(_ sender: UIButton) {
        if phoneNumberTextField.text != "" {
            registrationPhoneNumber()
        } else {
            messageLabel.text = " Enter your phone number!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabelAndButton()
        setupNavigationBar()
        
    }
    
    func registrationPhoneNumber() {
        let countryCode = "7"
        let phoneNumber = phoneNumberTextField.text ?? ""
        phoneNumberGlobalVar = phoneNumber
        let numberPhone = NumberPhone(phone: Phone(country_code: countryCode, phone_number: phoneNumber))
        servicesUser.registationPhoneNumber(phone: numberPhone, responseHandler: { (response) in
            if response.statusCode >= 200 && response.statusCode < 300 {
                DispatchQueue.main.async {
                    self.messageLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    self.messageLabel.text = "Phone number is registered!"
                    self.gotoEnterCodeSignUpViewController()
                }
            } else {
                DispatchQueue.main.async {
                    self.messageLabel.text = "This number is already registered.Sign in at this number or register a new one"
                }
            }
        })
    }
    
    func setupLabelAndButton() {
        messageLabel.text = ""
        messageLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        submitButton.layer.cornerRadius = 16.7
        submitButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        submitButton.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.7176470588, blue: 0.3921568627, alpha: 1)
    }
    
    func gotoEnterCodeSignUpViewController() {
        let userNameViewController = UIStoryboard(name: "SignUp", bundle: .main).instantiateViewController(withIdentifier: "UserNameVc") as! UserNameViewController
        self.navigationController?.pushViewController(userNameViewController, animated: true)
    }
    
    func setupNavigationBar() {
       navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
       navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
