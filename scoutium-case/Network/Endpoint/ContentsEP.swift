//
//  ContentsEP.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 7.02.2022.
//

import Foundation
import Alamofire

class ContentsEP: NetworkEncode {
    func execute(completion: @escaping (ContentModel?) -> ()) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(User.shared.token.value)",
            "Accept": "application/json"
        ]
        
        ApplicationLoader.shared.start()
        let request = AF.request("https://service.scoutium.com/content-hub/contents", method: .get, headers: headers)
        
        request.responseDecodable(of: ContentModel.self) { (response) in
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
