//
//  BaseVC.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 7.02.2022.
//

import Foundation
import UIKit

class BaseVC: UIViewController {
    func goToAuth() {
        let navC: UINavigationController = UINavigationController(rootViewController: AuthVC())
        navC.modalPresentationStyle = .overFullScreen
        self.present(navC, animated: true, completion: nil)
    }
    
    func goToContent() {
        let navC: UINavigationController = UINavigationController(rootViewController: ContentVC())
        navC.modalPresentationStyle = .overFullScreen
        self.present(navC, animated: true, completion: nil)
    }
}
