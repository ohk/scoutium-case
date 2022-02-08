//
//  ContentCell.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 6.02.2022.
//

import Foundation
import UIKit
import SDWebImage

class ContentCell: UITableViewCell {
    var data: Content? = nil
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var tags: UICollectionView! {
        didSet {
            self.tags.register(TagCell.nib, forCellWithReuseIdentifier: TagCell.reuseIdentifier)
            self.tags.dataSource = self
            self.tags.delegate = self
        }
    }
    
    func configure(data: Content?) {
        
        guard let data = data else { return }
        self.data = data
        if let headline = data.headline {
            self.headline.text = headline
        } else {
            self.headline.text = ""
        }
        
        if let summary = data.summary {
            self.summary.text = summary
        } else {
            self.summary.text = ""
        }
        
        if let author = data.author?.name, let readTime = data.read_time {
            self.author.text = "\(author) - \(readTime) min"
        } else {
            self.author.text = ""
        }
        
        if let authorImage = data.author?.image_url {
            self.authorImage.sd_setImage(with: URL(string: authorImage))
        } else {
            self.authorImage.image = nil
        }
        
        if let coverUrl = data.cover?.url {
            coverImage.sd_setImage(with: URL(string: coverUrl))
        } else {
            self.coverImage.image = nil
        }
        
        tags.reloadData()
    }
}

extension ContentCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data?.tags?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: TagCell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.reuseIdentifier, for: indexPath) as? TagCell, let tag = self.data?.tags?[safe: indexPath.row]  else {
            return UICollectionViewCell()
        }
        cell.configure(tag: tag)
        return cell
    }
    
    
}
