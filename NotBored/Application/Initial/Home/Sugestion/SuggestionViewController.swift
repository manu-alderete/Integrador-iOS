//
//  SuggestionViewController.swift
//  NotBored
//
//  Created by Agustin Figueroa on 21/09/2021.
//

import UIKit

class SuggestionViewController: BaseViewController {

//    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryView: UIView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    
    @IBOutlet weak var informationStack: UIStackView!
    @IBOutlet weak var nextButton: UIButton!
    
    let viewModel: SuggestionViewModel!
    
    init(participants: Int? = nil, category: Activity.ActivityType? = nil) {
        self.viewModel = SuggestionViewModel(
            service: ActivityService(),
            participants: participants,
            category: category
        )
        super.init()
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = SuggestionViewModel(service: ActivityService())
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryView.alpha = viewModel.category != nil ? 0 : 1
        hidesNavigationBar = true
        revertsNavigationBar = false
        titleLabel.text = viewModel.category?.rawValue.capitalized ?? "Random"
        activityLabel.alpha = 0
        informationStack.alpha = 0
        self.nextButton.alpha = 0
//        backButton.addTarget(self, action: #selector(backHandler), for: .touchUpInside)
        viewModel.fetchActivity()
        
        viewModel.onSuccess = { [weak self] in
            guard let self = self else { return }
            self.activityLabel.text = self.viewModel.activity?.name
            self.priceLabel.text = self.viewModel.activity?.getCostName()
            self.participantsLabel.text = self.viewModel.activity?.participants?.description ?? "-"
            self.activityLabel.alpha = 1
            self.informationStack.alpha = 1
            self.nextButton.alpha = 1
            self.categoryLabel.text = self.viewModel.activity?.activityType?.rawValue.capitalized
        }
        
        viewModel.onFailure = { [weak self] error in
            var message = "There has been an error, try again!"
            if let err = error as? ActivityService.APIError, err == .parameters {
                message = "Couldn't find any activity"
            }
            let alert = UIAlertController(title: "Not Bored", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: { _ in
                self?.backHandler()
            }))
            self?.present(alert, animated: true, completion: nil)
        }
        nextButton.layer.cornerRadius = 5
        nextButton.addTarget(self, action: #selector(nextHandler), for: .touchUpInside)
    }
    
    @objc private func nextHandler() {
        viewModel.fetchActivity()
    }
    
}

// Category
// Title label
