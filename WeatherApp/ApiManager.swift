//
//  apiManager.swift
//  WeatherApp
//
//  Created by 쌩 on 6/19/24.
//

import Foundation

import Alamofire

class ApiManager {
    //  , completion: @escaping ((Result<Weather, Error>) -> Void)
    func callRequest(cor: Int) {
        
        let parameters = [
                "lat" : "100",
                "lon" : "10",
                "appid": "\(APIKey.key)",
                
            ]
            
        AF.request(APIKey.url, method: .get, parameters: parameters ,encoding: URLEncoding.default).responseString{ data in
            print(data)
        }
     
//        responseDecodable(of: Books.self) { response in
//                switch response.result {
//                case .success(let repositories):
//                    completion(.success(repositories.items))
//                    
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//                
//            }
    }
    
}
