//
//  EnterPhoneNumberViewController.swift
//  Leepse
//
//  Created by Игорь Сазонов on 07.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit

class EnterPhoneNumberViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBAction func submitTapped(_ sender: UIButton) {
        gotoEnterCodeScreenViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupButton()
        setupLabel()
    }
    
    func gotoEnterCodeScreenViewController() {
        let enterCodeScreenViewController =  UIStoryboard(name: "SignIn", bundle: Bundle.main).instantiateViewController(withIdentifier: "EnterCodeVc") as! EnterCodeScreenViewController
        navigationController?.pushViewController(enterCodeScreenViewController, animated: true)
    }
    
    func setupNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func setupButton() {
        submitButton.layer.cornerRadius = 16.7
        submitButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        submitButton.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.7176470588, blue: 0.3921568627, alpha: 1)
    }
    
    func setupLabel() {
        messageLabel.text = "Enter the phone number associated with your username"
    }
}
