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
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var messageHeaderLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTheNavigationBar()
        setupButton()
        setupLabel()
        
        if UserDefaults.standard.bool(forKey: "IsUserLoggedIn") == true {
            let lastScreenViewController = UIStoryboard(name: "Last", bundle: .main).instantiateViewController(withIdentifier: "lastVc") as! LastScreenViewController
            self.navigationController?.setViewControllers([lastScreenViewController], animated: false)
        }
    }
    
    func setupTheNavigationBar() {
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
     }
    
    func setupButton() {
        signUpButton.layer.cornerRadius = 16.7
        signUpButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        signUpButton.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.7176470588, blue: 0.3921568627, alpha: 1)
        
        logInButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func setupLabel() {
        messageHeaderLabel.text = "A smart forum"
        messageLabel.text = "where you decide who can reply to your posts, and who can't"
    }
}
