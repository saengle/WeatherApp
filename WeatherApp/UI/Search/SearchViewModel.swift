//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by 쌩 on 7/14/24.
//

import Foundation

class SearchViewModel {
    
    let inputKeyword: Observable<String?> = Observable(nil)
    lazy var cities: [City] = []
    let outputCities: Observable<[City?]> = Observable([nil])
    
    lazy var searchedCities: [City] = []
    
    init() {
        cities = CityDataManager.shared.fetchData()
        
        inputKeyword.bind { _ in
            self.searchCity()
        }
    }
    
    private func searchCity() {
         let text = inputKeyword
        outputCities.value =  cities.filter{$0.name.lowercased().contains((text.value?.lowercased() ?? ""))}.map{$0}
    }
}
