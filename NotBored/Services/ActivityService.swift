//
//  SuggestionService.swift
//  NotBored
//
//  Created by Manuel Tomas Alderete Jabif on 22/09/2021.
//

import Foundation

struct ActivityService {
    let apiClient = AlamofireAPIClient()
    
    func getActivity(
        participants: Int? = nil,
        category: Activity.ActivityType? = nil,
        completion: @escaping (Result<Activity, Error>) ->Void
    )
    {
        let activityURL = "https://www.boredapi.com/api/activity?"
        var parameters = ""
        if let participants = participants {
            parameters.append("\(parameters.isEmpty ? "" : "&")participants=\(participants)")
        }
        if let category = category {
            parameters.append("\(parameters.isEmpty ? "" : "&")type=\(category.rawValue)")
        }
        apiClient.get(url: activityURL + parameters) { response in
            switch response {
            case .success(let data):
                do {
                    let activity = try JSONDecoder().decode(Activity.self, from: data)
                    completion(.success(activity))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
}
