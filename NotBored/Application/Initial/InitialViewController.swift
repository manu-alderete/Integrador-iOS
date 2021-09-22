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
                
        viewModel.onParticipantsValueChange = { [weak self] value in
            guard let self = self else { return }
            let valid = value != nil && value! >= 0 || (self.quantityTextField.text?.isEmpty ?? true)
            
            UIView.transition(with: self.startButton, duration: 0.3, options: .curveEaseIn) { [weak self] in
                guard let self = self else { return }
                self.startButton.backgroundColor = valid ? UIColor(named: "Bored Blue Light")  : UIColor.lightGray
                self.startButton.isUserInteractionEnabled = valid
            }
        }
        
        let attrs = [
            .font : UIFont.systemFont(ofSize: 16.0),
            .foregroundColor : UIColor.black,
            .underlineStyle : 1
        ] as [NSAttributedString.Key : Any]

        let attributedString = NSMutableAttributedString(string: "")

        let buttonTitleStr = NSMutableAttributedString(string: "Terms And Conditions", attributes: attrs)
        attributedString.append(buttonTitleStr)
        termsButton.setAttributedTitle(attributedString, for: .normal)
    }
    
    private func configureViews() {
        quantityTextField.layer.borderWidth = 1
        quantityTextField.layer.borderColor = UIColor.lightGray.cgColor
        quantityTextField.layer.cornerRadius = 5

        startButton.layer.cornerRadius = 5
        
        startButton.addTarget(self, action: #selector(startHandler), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(termsHandler), for: .touchUpInside)
        
        quantityTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

    }

    @objc private func startHandler() {
        let viewModel = HomeViewModel(participants: self.viewModel.participants)
        NavigationHelper.setRoot(HomeViewController(viewModel: viewModel))
    }
    
    @objc private func termsHandler() {
        let vc = TermsViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
     
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if textField === quantityTextField,
              let text = textField.text,
              let value = Int(text)
        {
            viewModel.participants = value
        } else {
            viewModel.participants = nil
        }
    }
}
