//
//  ContentVC.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 6.02.2022.
//

import Foundation
import UIKit
import RxSwift

class ContentVC: BaseVC {
    let viewModel = ContentVM()
    
    @IBOutlet weak var tableviewContents: UITableView! {
        didSet {
            tableviewContents.register(ContentCell.nib, forCellReuseIdentifier: ContentCell.reuseIdentifier)
            viewModel.response.observe(on: MainScheduler.instance).subscribe(onNext: { [tableviewContents] _ in
                tableviewContents?.reloadData()
            }).disposed(by: viewModel.disposeBag)
        }
    }
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func logout(_ sender: Any) {
        User.shared.setToken(token: "")
        self.goToAuth()
    }
}

extension ContentVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.response.value?.contents?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = viewModel.response.value?.contents?[safe: indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentCell.reuseIdentifier) as! ContentCell
        cell.configure(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = viewModel.response.value?.contents?[safe: indexPath.row], let id = data?.id else { return }
        let vC = ContentDetailVC()
        vC.viewModel.id.accept(id)
        self.navigationController?.pushViewController(vC, animated: true)
    }
}
