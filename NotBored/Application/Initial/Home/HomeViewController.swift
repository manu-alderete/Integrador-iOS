//
//  HomeViewController.swift
//  NotBored
//
//  Created by Manuel Tomas Alderete Jabif on 21/09/2021.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
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
        tableView.configure(
            delegate: self,
            dataSource: self,
            cells: [CategoryTableViewCell.self]
        )
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 25, right: 0)
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategoryTableViewCell.self), for: indexPath) as! CategoryTableViewCell
        return cell
    }
    
}
