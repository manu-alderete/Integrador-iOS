//
//  Category.swift
//  NotBored
//
//  Created by Manuel Tomas Alderete Jabif on 21/09/2021.
//

import Foundation

struct Activity: Codable {
    let name: String?
    let accessibility: Double?
    let activityType: ActivityType?
    let participants: Int?
    let price: Double?
    let link: String?
    let key: String?
    
    enum ActivityType: String, CaseIterable, Codable {
        case education
        case recreational
        case social
        case diy
        case charity
        case cooking
        case relaxation
        case music
        case busywork
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "activity"
        case accessibility
        case activityType = "type"
        case participants
        case price
        case link
        case key
    }
    
    func getCostName() -> String {
        var result = ""
        if let price = self.price, price >= 0 {
            if price == 0 {
                result = "Free"
            } else if price <= 0.3 {
                result = "Low"
            } else if price <= 0.6 {
                result = "medium"
            } else {
                result = "High"
            }
        } else {
            result = "-"
        }
        return result
    }
}

/**
 {
     "activity": "Learn Express.js",
     "accessibility": 0.25,
     "type": "education",
     "participants": 1,
     "price": 0.1,
     "link": "https://expressjs.com/",
     "key": "3943506"
 }
 */
