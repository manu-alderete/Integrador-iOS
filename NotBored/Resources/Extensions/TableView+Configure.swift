//
//  TableView+Configure.swift
//  NotBored
//
//  Created by Manuel Tomas Alderete Jabif on 21/09/2021.
//

import Foundation
import UIKit

extension UITableView {
    func configure(delegate: UITableViewDelegate, dataSource: UITableViewDataSource, cells: [UITableViewCell.Type]) {
        self.delegate = delegate
        self.dataSource = dataSource
        for cell in cells {
            self.register(
                UINib(
                    nibName: String(describing: cell.self),
                    bundle: nil
                ),
                forCellReuseIdentifier: String(describing: cell.self)
            )
        }
    }
}
