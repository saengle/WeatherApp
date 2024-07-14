//
//  MainViewModel.swift
//  WeatherApp
//
//  Created by 쌩 on 7/14/24.
//

import Foundation

class MainViewModel {
    
    let outputWeather: Observable<MyWeather?> = Observable(nil)
    
    init() {
        fetchWeatherData(lat: 37.654165, lon: 127.049696)
    }
    
    func fetchWeatherData(lat: Double, lon: Double) {
        APIManager.fetchAPI(api: APIModel.hoursWeather(lat: lat, lon: lon), type: MyWeather.self) { value in
            switch value {
            case .success(let data):
                self.outputWeather.value = data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
