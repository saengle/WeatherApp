//
//  UserManager.swift
//  WeatherApp
//
//  Created by 쌩 on 7/15/24.
//

import Foundation

struct UserManager {
    
    static var lat: Double {
        get { UserDefaults.standard.double(forKey: "lat") }
        set { UserDefaults.standard.set(newValue, forKey: "lat") }
    }
    static var lon: Double {
        get { UserDefaults.standard.double(forKey: "lon") }
        set { UserDefaults.standard.set(newValue, forKey: "lon") }
    }
}
