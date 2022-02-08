//
//  AppStorage.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 7.02.2022.
//

import Foundation

class AppStorage {
    public static let shared = AppStorage()
    private let userDefaults =  UserDefaults.standard
    private let AUTH_TOKEN = "auth_token"
    
    public func getAuthToken() -> String {
        return readStringData(key: AUTH_TOKEN)
    }
    
    public func setAuthToken(_ token : String) {
        writeAnyData(key: AUTH_TOKEN, value: token)
        User.shared.token.accept(token)
    }
    
    private func readStringData(key: String) -> String{
        if userDefaults.object(forKey: key) == nil {
            return ""
        } else {
            return userDefaults.string(forKey: key)!
        }
    }
    
    private func writeAnyData(key: String, value: Any){
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }
}
