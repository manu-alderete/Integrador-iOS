//
//  TermsViewController.swift
//  NotBored
//
//  Created by Manuel Tomas Alderete Jabif on 21/09/2021.
//

import UIKit

class TermsViewController: BaseViewController {
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeButton.addTarget(self, action: #selector(closeHandler), for: .touchUpInside)

    }

    @objc private func closeHandler() {
        self.dismiss(animated: true)
    }
    
}
