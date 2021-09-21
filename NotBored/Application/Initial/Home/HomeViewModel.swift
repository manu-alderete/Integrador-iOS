//
//  HomeViewModel.swift
//  NotBored
//
//  Created by Manuel Tomas Alderete Jabif on 21/09/2021.
//

import Foundation

final class HomeViewModel {
    private let participants: Int
    
    private(set) var categories: [Category] = [] {
        didSet {
            onCategoriesValueChange?()
        }
    }
    
    var onCategoriesValueChange: (()->Void)? = nil
    
    init(participants: Int) {
        self.participants = participants
    }
    
    func fetchCategories() {
        categories = [
            
        ]
    }
}
