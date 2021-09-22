//
//  AlamofireAPIClient.swift
//  NotBored
//
//  Created by Manuel Tomas Alderete Jabif on 22/09/2021.
//

import Foundation
import Alamofire

struct AlamofireAPIClient {
    func get(url: String, parameters: Dictionary<String, Any>? = nil, completion: @escaping (Result<Data, AFError>) -> Void) {
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseData { response in
            completion(response.result)
        }
    }
}
