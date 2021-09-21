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
    
    var viewModel: InitialViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = InitialViewModel()
        
        hidesNavigationBar = true
        revertsNavigationBar = false
        
        configureViews()
        
        startButton.addTarget(self, action: #selector(startHandler), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(termsHandler), for: .touchUpInside)
        
        quantityTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        viewModel.onParticipantsValueChange = { [weak self] value in
            self?.startButton.isEnabled = value != nil && value! > 0
        }
    }
    
    private func configureViews() {
        quantityTextField.layer.borderWidth = 1
        quantityTextField.layer.borderColor = UIColor.lightGray.cgColor
        quantityTextField.layer.cornerRadius = 5
    }

    @objc private func startHandler() {
        guard let participants = viewModel.participants else { return }
        let viewModel = HomeViewModel(participants: participants)
        NavigationHelper.setRoot(HomeViewController(viewModel: viewModel))
    }
    
    @objc private func termsHandler() {
        let vc = TermsViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
     
    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard textField === quantityTextField,
              let text = textField.text,
              let value = Int(text) else
        {
            viewModel.participants = nil
            return
        }
        viewModel.participants = value
    }
}
