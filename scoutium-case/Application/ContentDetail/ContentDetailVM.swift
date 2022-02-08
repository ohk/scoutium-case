//
//  ContentDetailVM.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 7.02.2022.
//

import Foundation
import RxSwift
import RxRelay

class ContentDetailVM {
    let disposeBag = DisposeBag()
    let id = BehaviorRelay<String?>(value: nil)
    let response = BehaviorRelay<ContentDetailModel?>(value: nil)
    init() {
        id.observe(on: MainScheduler.instance).subscribe(onNext: { [weak self] data in
            if data != "" {
                self?.getDetail()
            }
        }).disposed(by: disposeBag)
    }
    
    func getDetail(){
        guard let id = id.value else { return }
        ContentDetailEP(id: id).execute { [weak self] data in
            self?.response.accept(data)
        }
    }
}
