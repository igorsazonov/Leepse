//
//  Request.swift
//  Leepse
//
//  Created by Игорь Сазонов on 10.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import Foundation

struct UserSignUp: Codable {
    let verification_code: String
    let phone: Phone
    let user: User
}
