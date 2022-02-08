//
//  AuthModel.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 6.02.2022.
//

import Foundation

class AuthModel: Codable {
    var access_token: String?
    
    enum CodingKeys: String, CodingKey {
        case access_token = "access_token"
    }
    
    init(access_token: String?){
        self.access_token = access_token
    }
}
