//
//  AuthEP.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 7.02.2022.
//

import Foundation
import Alamofire

class AuthEP: NetworkEncode {
    var username: String
    var password: String
    
    init(username: String,password: String) {
        self.username = username
        self.password = password
    }
    
    func execute(completion: @escaping (AuthModel?) -> ()) {
        ApplicationLoader.shared.start()
        let request = AF.request("https://api.scoutium.com/api/oauth/token", method: .post, parameters: ["username": self.username,"password": self.password], encoding: JSONEncoding.default, headers: nil)
        
        request.responseDecodable(of: AuthModel.self) { (response) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                ApplicationLoader.shared.dismiss()
            })
            guard let response = response.value else {
                return
            }
            completion(response)
        }
        
    }
}
