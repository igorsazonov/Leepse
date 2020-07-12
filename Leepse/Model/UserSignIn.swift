//
//  UserSignIn.swift
//  Leepse
//
//  Created by Игорь Сазонов on 12.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import Foundation

struct UserSignIn: Codable {
    let verification_code: String
    let phone: Phone
}
