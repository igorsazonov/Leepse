//
//  LastScreenViewController.swift
//  Leepse
//
//  Created by Игорь Сазонов on 07.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit

class LastScreenViewController: UIViewController {

    @IBAction func logoutTapped(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "ISUSERLOGGEDIN")
        UserDefaults.standard.removeObject(forKey: "user")
        gotoFirstScreenViewController()
    }
    
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = UserDefaults.standard.string(forKey: "user")
    }
    
    func gotoFirstScreenViewController() {
        let firstScreenViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "FirstVc")
        navigationController?.setViewControllers([firstScreenViewController], animated: true)
    }
    
    func setupNavigationBarItems() {
        let titleImageView = logoImage
        titleImageView?.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: logoutButton)
    }
}
