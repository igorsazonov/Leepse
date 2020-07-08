//
//  FirstScreenViewController.swift
//  Leepse
//
//  Created by Игорь Сазонов on 07.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func tupSignUp(_ sender: UIButton) {
    
    }
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBAction func tupLogIn(_ sender: UIButton) {
        let signInViewController = (UIStoryboard(name: "SignIn", bundle: Bundle.main).instantiateViewController(withIdentifier: "EnterPhoneVc") as? EnterPhoneNumberViewController)!
        navigationController?.pushViewController(signInViewController, animated: true)
    }
    
    @IBOutlet weak var messageHeaderLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        settingUpTheViewButtons()
        messageHeaderLabel.text = "A smart forum"
        messageLabel.text = "where you decide who can reply to your posts, and who can't"
    }
    
    func settingUpTheViewButtons() {
        signUpButton.layer.cornerRadius = 16.7
        signUpButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        signUpButton.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.7176470588, blue: 0.3921568627, alpha: 1)
        
        logInButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
