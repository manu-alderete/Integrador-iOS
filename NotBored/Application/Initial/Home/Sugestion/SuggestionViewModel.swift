//
//  SuggestionViewModel.swift
//  NotBored
//
//  Created by Manuel Tomas Alderete Jabif on 22/09/2021.
//

import Foundation

final class SuggestionViewModel {
    let activityService: ActivityService
    let category: Activity.ActivityType?
    let participants: Int?
    var activity: Activity? = nil
    
    private(set) var isFetchingActivity = false
    
    var onSuccess: (()->Void)?
    var onFailure: ((Error)->Void)?
    
    init(service: ActivityService, participants: Int? = nil, category: Activity.ActivityType? = nil) {
        self.category = category
        self.activityService = service
        self.participants = participants
    }
    
    func fetchActivity() {
        guard !isFetchingActivity else { return }
        isFetchingActivity = true
        activityService.getActivity(
            participants: participants,
            category: category) { [weak self] result in
            switch result {
            case .success(let activity):
                self?.activity = activity
                self?.isFetchingActivity = false
                self?.onSuccess?()
            case .failure(let error):
                self?.onFailure?(error)
                self?.isFetchingActivity = false
            }
        }
    }
}
