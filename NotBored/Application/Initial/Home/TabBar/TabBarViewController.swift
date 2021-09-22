//
//  TabBarViewController.swift
//  NotBored
//
//  Created by Manuel Tomas Alderete Jabif on 22/09/2021.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    
    var participants: Int?
    
    init(participants: Int?) {
        self.participants = participants
        super.init(nibName: String(describing: TabBarController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let questionNavigationController = SuggestionViewController()
        questionNavigationController.tabBarItem = UITabBarItem(
            title: "Random",
            image: UIImage(systemName: "shuffle")?.withTintColor(.lightGray),
            selectedImage: UIImage(systemName: "shuffle")?.withTintColor(.blue)
        )
        let categoryNavigationController = CategoriesViewController(viewModel: CategoriesViewModel(participants: participants))
        categoryNavigationController.tabBarItem = UITabBarItem(
            title: "Categories",
            image: UIImage(systemName: "list.bullet")?.withTintColor(.lightGray),
            selectedImage: UIImage(systemName: "list.bullet")?.withTintColor(.blue)
        )
        
        viewControllers = [
            categoryNavigationController,
            questionNavigationController
        ]
    }
}
