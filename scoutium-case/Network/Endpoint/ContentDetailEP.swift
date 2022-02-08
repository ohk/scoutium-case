//
//  ContentDetailEP.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 7.02.2022.
//

import Foundation
import Alamofire

class ContentDetailEP: NetworkEncode {
    var id: String
    
    init(id: String) {
        self.id = id
    }
    
    let headers: HTTPHeaders = [
        "Authorization": "Bearer \(User.shared.token.value)",
        "Accept": "application/json"
    ]
    
    func execute(completion: @escaping (ContentDetailModel?) -> ()) {
        ApplicationLoader.shared.start()
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(User.shared.token.value)",
            "Accept": "application/json"
        ]
        
        let request = AF.request("https://service.scoutium.com/content-hub/contents/" + self.id, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)

        request.responseDecodable(of: ContentDetailModel.self) { (response) in
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data: \(utf8Text)")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                ApplicationLoader.shared.dismiss()
            })
            debugPrint(response)
            guard let response = response.value else {
                return
            }
            completion(response)
        }
        
    }
}
