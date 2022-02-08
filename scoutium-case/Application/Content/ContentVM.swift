//
//  ContentVM.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 6.02.2022.
//

import Foundation
import RxSwift
import RxCocoa

class ContentVM {
    let disposeBag = DisposeBag()
    let response = BehaviorRelay<ContentModel?>(value: nil)
    
    
    init() {
        getContent()
    }
    
    func getContent(){
        ContentsEP().execute { data in
            self.response.accept(data)
        }
    }
}
