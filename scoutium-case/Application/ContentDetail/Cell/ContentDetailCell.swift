//
//  ContentDetailCell.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 8.02.2022.
//

import Foundation
import UIKit

class ContentDetailCell: UITableViewCell {
    @IBOutlet weak var h2: UILabel!
    @IBOutlet weak var p: UILabel!
    
    func configure(tag: ContentTags?){
        if let h2 = tag?.h2 {
            self.h2.text = h2
            self.p.isHidden = true
        } else if let p = tag?.p {
            self.p.text = p
            self.h2.isHidden = true
        } else {
            self.p.isHidden = true
            self.h2.isHidden = true
        }
    }
}
