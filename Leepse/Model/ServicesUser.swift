//
//  ServicesUser.swift
//  Leepse
//
//  Created by Игорь Сазонов on 11.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import Foundation

class ServicesUser {
    
    func registationPhoneNumber(phone: NumberPhone, responseHandler: @escaping (HTTPURLResponse) -> Void) {
        guard let url = URL(string: "https://leepse.jetruby.cloud/api/v2/phone_verifications/sign_up") else { return }
        let newPhone = phone
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonData = try? JSONEncoder().encode(newPhone)
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse {
                print(response)
                responseHandler(response)
            }
        }
        task.resume()
    }
    
    func registationUser(user: UserSignUp, responseHandler: @escaping (HTTPURLResponse) -> Void, userHandler: @escaping (UserResponse) -> Void, errorHandler: @escaping (ResponseError) -> Void) {
        guard let url = URL(string: "https://leepse.jetruby.cloud/apiv2/registrations") else { return }
        let newUser = user
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonData = try? JSONEncoder().encode(newUser)
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let user = try JSONDecoder().decode(UserResponse.self, from: data)
                userHandler(user)
            } catch {
                print(error)
            }
            
            do {
                let error = try JSONDecoder().decode(ResponseError.self, from: data)
                errorHandler(error)
            } catch {
                
            }
            
            if let response = response as? HTTPURLResponse {
                responseHandler(response)
            }
        }
        task.resume()
    }
}
