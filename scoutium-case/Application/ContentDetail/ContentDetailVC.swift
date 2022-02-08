//
//  ContentDetailVC.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 7.02.2022.
//

import Foundation
import UIKit
import RxSwift
class ContentDetailVC: BaseVC {
    let viewModel = ContentDetailVM()
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            viewModel.response.observe(on: MainScheduler.instance).subscribe(onNext: { [weak self] data in
                if data?.content?.headline != "" {
                    self?.titleLabel.text = data?.content?.headline
                } else {
                    self?.titleLabel.text = ""
                }
            }).disposed(by: viewModel.disposeBag)
        }
    }
    
    @IBOutlet weak var infoLabel: UILabel! {
        didSet {
            viewModel.response.observe(on: MainScheduler.instance).subscribe(onNext: { [weak self] data in
                if let author = data?.content?.author?.name, let time = data?.content?.read_time{
                    self?.infoLabel.text = "\(author) - \(time) min"
                } else {
                    self?.infoLabel.text = ""
                }
            }).disposed(by: viewModel.disposeBag)
        }
    }
    
    @IBOutlet weak var tags: UICollectionView! {
        didSet {
            self.tags.register(TagCell.nib, forCellWithReuseIdentifier: TagCell.reuseIdentifier)
            viewModel.response.observe(on: MainScheduler.instance).subscribe(onNext: { [weak self] data in
                self?.tags.reloadData()
            }).disposed(by: viewModel.disposeBag)
        }
    }
    
    @IBOutlet weak var content: UITableView! {
        didSet {
            content.register(ContentDetailCell.nib, forCellReuseIdentifier: ContentDetailCell.reuseIdentifier)
            viewModel.response.observe(on: MainScheduler.instance).subscribe(onNext: { [weak self] data in
                self?.content.reloadData()
            }).disposed(by: viewModel.disposeBag)
        }
    }
}


extension ContentDetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.response.value?.content?.tags?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: TagCell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.reuseIdentifier, for: indexPath) as? TagCell, let tag = viewModel.response.value?.content?.tags?[safe: indexPath.row]  else {
            return UICollectionViewCell()
        }
        cell.configure(tag: tag)
        return cell
    }
}

extension ContentDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.response.value?.content?.content?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = viewModel.response.value?.content?.content?[safe: indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentDetailCell.reuseIdentifier) as! ContentDetailCell
        cell.configure(tag: data)
        return cell
    }
    
    
}
