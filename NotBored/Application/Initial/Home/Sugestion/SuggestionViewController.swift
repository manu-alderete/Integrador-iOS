//
//  SuggestionViewController.swift
//  NotBored
//
//  Created by Agustin Figueroa on 21/09/2021.
//

import UIKit

class SuggestionViewController: BaseViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryView: UIView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    let viewModel: SuggestionViewModel!
    
    init(participants: Int, category: Activity.ActivityType? = nil) {
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
        categoryView.isHidden = viewModel.category != nil
        hidesNavigationBar = true
        revertsNavigationBar = false
        titleLabel.text = viewModel.category?.rawValue.capitalized
        backButton.addTarget(self, action: #selector(backHandler), for: .touchUpInside)
        viewModel.fetchActivity()
        
        viewModel.onSuccess = { [weak self] in
            guard let self = self else { return }
            self.activityLabel.text = self.viewModel.activity?.name
            self.priceLabel.text = self.viewModel.activity?.getCostName()
            self.participantsLabel.text = self.viewModel.activity?.participants?.description ?? "-"
        }
        
        viewModel.onFailure = { [weak self] _ in
            let alert = UIAlertController(title: "Not Bored", message: "There has been an error, try again!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
            self?.present(alert, animated: true, completion: nil)
        }
        nextButton.layer.cornerRadius = 5
        nextButton.addTarget(self, action: #selector(nextHandler), for: .touchUpInside)
    }
    
    @objc private func nextHandler() {
        viewModel.fetchActivity()
    }
    
}
