//
//  AuthVC.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 7.02.2022.
//

import Foundation
import UIKit
import RxSwift

class AuthVC: BaseVC {
    let viewModel = AuthVM()
    
    @IBOutlet weak var inputPhoneNumber: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        User.shared.token.observe(on: MainScheduler.instance).subscribe(onNext: { [weak self] data in
            if data != "" {
                self?.goToContent()
            }
        }).disposed(by: viewModel.disposeBag)
    }
    
    @IBAction func autoFill(_ sender: Any) {
        inputPhoneNumber.text = "+905447604853"
        inputPassword.text = "654321"
        
        viewModel.username.accept("+905447604853")
        viewModel.password.accept("654321")
    }
    
    @IBAction func loginBtnClick(_ sender: Any) {
        viewModel.login()
    }
}

extension AuthVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true}
        let newText = (text as NSString).replacingCharacters(in: range, with: string)
        switch textField {
        case inputPhoneNumber:
            viewModel.username.accept(newText)
        case inputPassword:
            viewModel.password.accept(newText)
        default:
            print("Unknown error.")
        }
        return true
    }
}
