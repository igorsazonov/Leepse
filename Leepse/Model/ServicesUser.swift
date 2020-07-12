//
//  ServicesUser.swift
//  Leepse
//
//  Created by Игорь Сазонов on 11.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import Foundation

class ServicesUser {
    
    func registationPhoneNumber(phone: NumberPhone, statucCode: @escaping (Int) -> Void, errorHandler: @escaping (Error?) -> Void) {
        guard let url = URL(string: "https://leepse.jetruby.cloud/api/v2/phone_verifications/sign_up") else { return }
        let newPhone = phone
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonData = try? JSONEncoder().encode(newPhone)
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse {
                statucCode(response.statusCode)
            }
            errorHandler(error)
        }
        task.resume()
    }
    
    func registationUser(user: UserSignUp) {
        guard let url = URL(string: "https://leepse.jetruby.cloud/apiv2/registrations") else { return }
        let newUser = user
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonData = try? JSONEncoder().encode(newUser)
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse {
                switch  response.statusCode {
                case 200..<300:
                    print("Succes")
                default:
                    print("Status: \(response.statusCode)")
                }
            }
        }
        task.resume()
    }
}
