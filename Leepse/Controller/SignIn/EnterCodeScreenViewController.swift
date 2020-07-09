//
//  EnterCodeScreenViewController.swift
//  Leepse
//
//  Created by Игорь Сазонов on 08.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit

class EnterCodeScreenViewController: UIViewController {

    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBAction func tappedSubmit(_ sender: UIButton) {
        let lastScreenViewController =  UIStoryboard(name: "Last", bundle: Bundle.main).instantiateViewController(withIdentifier: "lastVc") as! LastScreenViewController
        navigationController?.pushViewController(lastScreenViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuringTheNavigationBar()
        configuringTheLabelAndButton()
        
    }
    
    func configuringTheLabelAndButton() {
        errorMessage.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        submitButton.layer.cornerRadius = 16.7
        submitButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        submitButton.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.7176470588, blue: 0.3921568627, alpha: 1)
    }
    
    func configuringTheNavigationBar() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backButton")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
