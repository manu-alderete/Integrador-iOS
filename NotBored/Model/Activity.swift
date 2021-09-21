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
    
    enum ActivityType: String, Codable {
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
