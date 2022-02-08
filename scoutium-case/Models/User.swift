//
//  User.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 7.02.2022.
//

import Foundation
import RxSwift
import RxCocoa
class User {
    public static let shared = User()
    
    var token = BehaviorRelay<String>(value: "")
    
    init() {
        token.accept(AppStorage.shared.getAuthToken())
    }
    
    func setToken(token: String) {
        self.token.accept(token)
        AppStorage.shared.setAuthToken(token)
    }
}
