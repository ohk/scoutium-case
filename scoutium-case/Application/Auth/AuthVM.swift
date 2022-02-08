//
//  AuthVM.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 7.02.2022.
//

import Foundation
import RxSwift
import RxCocoa

class AuthVM {
    let disposeBag = DisposeBag()
    let username = BehaviorRelay<String>(value: "")
    let password = BehaviorRelay<String>(value: "")
    var waiting = true
    
    func login(){
        if waiting == true {
            waiting = false
            AuthEP(username: username.value, password: password.value).execute { [weak self] data in
                self?.waiting = true
                guard let token = data?.access_token else { return }
                User.shared.setToken(token: token)
            }
        }
    }
}
