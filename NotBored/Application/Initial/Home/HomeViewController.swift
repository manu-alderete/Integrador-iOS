//
//  HomeViewController.swift
//  NotBored
//
//  Created by Manuel Tomas Alderete Jabif on 21/09/2021.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var shuffleButton: UIButton!
    
    var viewModel: HomeViewModel!
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hidesNavigationBar = true
        revertsNavigationBar = false
        tableView.configure(
            delegate: self,
            dataSource: self,
            cells: [CategoryTableViewCell.self]
        )
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 25, right: 0)
        
        viewModel.onCategoriesValueChange = { [weak self] in
            self?.tableView.reloadData()
        }
        
        shuffleButton.addTarget(self, action: #selector(shuffleHandler), for: .touchUpInside)
        viewModel.fetchCategories()
    }
    
    @objc private func shuffleHandler() {
        navigationController?.pushViewController(SuggestionViewController(participants: viewModel.participants), animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategoryTableViewCell.self), for: indexPath) as! CategoryTableViewCell
        cell.configure(with: viewModel.categories[indexPath.row].rawValue)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(
            SuggestionViewController(
                participants: viewModel.participants,
                category: viewModel.categories[indexPath.row]
            ),
            animated: true
        )
    }
}
