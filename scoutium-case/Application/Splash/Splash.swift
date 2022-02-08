//
//  Splash.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 7.02.2022.
//

import Foundation
import UIKit

class Splash: BaseVC {
    private let gradient = CAGradientLayer()
    
    override func viewDidLoad() {
        checkConnection()
        animateGradient()
    }
    
    func checkConnection(){
        DispatchQueue.main.async{
        if !NetworkMonitor.shared.isConnected {
            self.showNativeAlertWith(message: "İnternet bağlantınız bulunmuyor. Uygulamadan Çıkış Yapılacaktır.", action: UIAlertAction(title: "Tamam", style: .destructive, handler: { (action) in
                exit(-1)
            }))
        } else {
            self.startApp()
        }}
    }
    
    private func animateGradient() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            // create the gradient layer
            self.gradient.frame = self.view.frame
            self.gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
            self.gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
            self.gradient.colors = [UIColor.white.cgColor, UIColor.softPrimaryColor.cgColor, UIColor.primaryColor.cgColor]
            self.gradient.locations =  [1, 0.5, 0, 0.5, 1.5]
            
            let animation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.colors))
            animation.fromValue = [UIColor.softPrimaryColor.cgColor,UIColor.softPrimaryColor.cgColor, UIColor.primaryColor.cgColor]
            animation.toValue = [UIColor.primaryColor.cgColor, UIColor.softPrimaryColor.cgColor, UIColor.primaryColor.cgColor]
            animation.duration = 1
            animation.autoreverses = true
            animation.repeatCount = .infinity
            
            self.gradient.add(animation, forKey: nil)
            self.view.layer.insertSublayer(self.gradient, at: 0)
        }
    }
    
    private func startApp(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            if User.shared.token.value != "" {
                self.goToContent()
            } else {
                self.goToAuth()
            }

        })
    }
}
