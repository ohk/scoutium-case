//
//  NetworkEncode.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 7.02.2022.
//

import Foundation

class NetworkEncode: Encodable {
    func toDictionary() -> [String: Any] {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .millisecondsSince1970
        guard let json = try? encoder.encode(self),
               let dict = try? JSONSerialization.jsonObject(with: json, options: []) as? [String: Any] else {
            return [:]
        }
        return dict
    }
}
