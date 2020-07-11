//
//  EnterCodeSignUpViewController.swift
//  Leepse
//
//  Created by Игорь Сазонов on 09.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit

class EnterCodeSignUpViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var codeTextField: UITextField!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func submitTapped(_ sender: UIButton) {
        gotoLastScreenViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabelAndButton()
        codeTextField.defaultTextAttributes.updateValue(50.0, forKey: NSAttributedString.Key.kern)
    }
    
    func setupLabelAndButton() {
        numberLabel.text = ""
        messageLabel.text = "message"
        submitButton.layer.cornerRadius = 16.7
        submitButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        submitButton.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.7176470588, blue: 0.3921568627, alpha: 1)
    }
    
    func gotoLastScreenViewController() {
        let lastScreenViewController = UIStoryboard(name: "Last", bundle: .main).instantiateViewController(withIdentifier: "lastVc") as! LastScreenViewController
        navigationController?.setViewControllers([lastScreenViewController], animated: true)
    }
}
