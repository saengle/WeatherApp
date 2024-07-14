//
//  CityDataManager.swift
//  WeatherApp
//
//  Created by 쌩 on 7/14/24.
//

import Foundation

final class CityDataManager {
    
    static let shared = CityDataManager()
    
    private init() {}
    
    func fetchData() -> [City] {
        if let path = Bundle.main.path(forResource: "CityList", ofType: "json")  {
            if let jsonString = try? String(contentsOfFile: path){
                let decoder = JSONDecoder()
                let data = jsonString.data(using: .utf8)
                if let data = data,
                   let city = try? decoder.decode([City].self, from: data) {
                    return city
                }
            }
        }
        return []
    }
}
