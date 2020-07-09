//
//  LastScreenViewController.swift
//  Leepse
//
//  Created by Игорь Сазонов on 07.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit

class LastScreenViewController: UIViewController {

    @IBAction func tappedLogout(_ sender: UIButton) {
        let firstScreenViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "FirstVc")
        navigationController?.setViewControllers([firstScreenViewController], animated: true)
    }
    
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBarItems()
    }
    
    func customNavigationBarItems() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "logo (1)"))
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: logoutButton)
    }
}
