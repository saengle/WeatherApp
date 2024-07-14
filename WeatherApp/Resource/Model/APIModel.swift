//
//  APIModel.swift
//  WeatherApp
//
//  Created by 쌩 on 7/14/24.
//

import Foundation
import Alamofire

enum APIModel {
    
    case hoursWeather(lat: Double, lon: Double)
    case images(image: String)
    
    var baseURL: String {
        return "https://api.openweathermap.org/"
    }
    
    var endpoint: URL {
        switch self {
        case .hoursWeather(lat: _, lon: _):
            return URL(string: baseURL + "data/2.5/forecast")!
        case .images(image: let image):
            return URL(string: baseURL + "img/wn/" + image + "@2x.png")!
        }
    }
    
    var parameter: [String: String]{
        switch self {
        case .hoursWeather(lat: let lat, lon: let lon):
            return  [ "lat" : "\(lat)",
                      "lon" : "\(lon)",
                      "appid" : APISecure.key]
        case .images:
            return [:]
        }
    }
        
        var method: HTTPMethod {
            return .get
        }
        
        var encoding: URLEncoding {
            return URLEncoding(destination: .queryString)
        }
}
