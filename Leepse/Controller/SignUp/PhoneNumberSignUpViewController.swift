//
//  PhoneNumberSignUpViewController.swift
//  Leepse
//
//  Created by Игорь Сазонов on 09.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit

class PhoneNumberSignUpViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBAction func tappedSubmit(_ sender: UIButton) {
        transitionToViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customLabelAndButton()
        configuringTheNavigationBar()
    }
    
    func customLabelAndButton() {
        messageLabel.text = ""
        submitButton.layer.cornerRadius = 16.7
        submitButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        submitButton.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.7176470588, blue: 0.3921568627, alpha: 1)
    }
    
    func  transitionToViewController() {
        let enterCodeSignUpViewController = UIStoryboard(name: "SignUp", bundle: .main).instantiateViewController(withIdentifier: "CodeSignUpVc") as! EnterCodeSignUpViewController
        navigationController?.pushViewController(enterCodeSignUpViewController, animated: true)
    }
    
    func configuringTheNavigationBar() {
       navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
       navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
