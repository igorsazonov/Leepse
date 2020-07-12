//
//  PhoneNumberSignUpViewController.swift
//  Leepse
//
//  Created by Игорь Сазонов on 09.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit

class PhoneNumberSignUpViewController: UIViewController {
    
    let servicesUser = ServicesUser()
    var messageError = ""

    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBAction func submitTapped(_ sender: UIButton) {
        if phoneNumberTextField.text != "" {
            registrationPhoneNumber()
        } else {
            messageError = " Enter your phone number!"
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
        let numberPhone = NumberPhone(phone: Phone(countryCode: countryCode, phoneNumber: phoneNumber))
        servicesUser.registationPhoneNumber(phone: numberPhone, statucCode: { (statusCode) in
            if statusCode >= 200 && statusCode < 300 {
                print("registration phone Number - OK")
                self.gotoEnterCodeSignUpViewController()
            } else {
                self.messageError = "This number is already registered.Sign in at this number or register a new one"
            }
        }, errorHandler: { (error) in
            //self.messageError = error?.localizedDescription ?? ""
            print(error?.localizedDescription ?? "Error")
        })
    }
    
    func setupLabelAndButton() {
        messageLabel.text = messageError
        messageLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        submitButton.layer.cornerRadius = 16.7
        submitButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        submitButton.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.7176470588, blue: 0.3921568627, alpha: 1)
    }
    
    func  gotoEnterCodeSignUpViewController() {
        let enterCodeSignUpViewController = UIStoryboard(name: "SignUp", bundle: .main).instantiateViewController(withIdentifier: "CodeSignUpVc") as! EnterCodeSignUpViewController
        navigationController?.pushViewController(enterCodeSignUpViewController, animated: true)
    }
    
    func setupNavigationBar() {
       navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
       navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
