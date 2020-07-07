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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.layer.cornerRadius = 16.7
    }
}
