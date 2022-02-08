//
//  TagCell.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 8.02.2022.
//

import Foundation
import UIKit

class TagCell: UICollectionViewCell {
    
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var background: UIStackView!
    
    func configure(tag: Tag?) {
        guard let tag = tag else {
            return
        }
        
        if let name = tag.name {
            tagLabel.text = name
        } else {
            tagLabel.text = ""
        }
        
        if let background = tag.background_color {
            self.background.backgroundColor = UIColor(hexString: background)
        } else {
            self.background.backgroundColor = UIColor.white
        }
        
        if let color = tag.color {
            tagLabel.textColor = UIColor(hexString: color)
        } else {
            tagLabel.textColor = UIColor.black
        }
    }
}
