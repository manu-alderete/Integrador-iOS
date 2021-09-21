//
//  InitialViewController.swift
//  NotBored
//
//  Created by Manuel Tomas Alderete Jabif on 21/09/2021.
//

import UIKit

class InitialViewController: BaseViewController {
    
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var termsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hidesNavigationBar = true
        
        configureViews()
        
        startButton.addTarget(self, action: #selector(startHandler), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(termsHandler), for: .touchUpInside)
    }
    
    private func configureViews() {
        quantityTextField.layer.borderWidth = 1
        quantityTextField.layer.borderColor = UIColor.lightGray.cgColor
        quantityTextField.layer.cornerRadius = 5
    }

    @objc private func startHandler() {
        
    }
    
    @objc private func termsHandler() {
        
    }
}
