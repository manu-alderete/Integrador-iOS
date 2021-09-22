//
//  CategoryTableViewCell.swift
//  NotBored
//
//  Created by Manuel Tomas Alderete Jabif on 21/09/2021.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with name: String) {
        nameLabel.text = name.capitalized
    }
    
}
