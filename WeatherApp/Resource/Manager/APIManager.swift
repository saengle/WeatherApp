//
//  APIManager.swift
//  WeatherApp
//
//  Created by 쌩 on 7/14/24.
//

import Foundation

import Alamofire

class APIManager {
    
    static func fetchAPI<T: Decodable>(api: APIModel, type: T.Type = T.self, completion: @escaping((Result<T, AFError>) -> Void)) {
        AF.request(api.endpoint, method: api.method, parameters: api.parameter, encoding: api.encoding).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let repositories):
                completion(.success(repositories))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
