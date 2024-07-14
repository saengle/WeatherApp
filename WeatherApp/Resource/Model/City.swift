//
//  City.swift
//  WeatherApp
//
//  Created by 쌩 on 7/14/24.
//

import Foundation

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let state: State
    let country: Country
    let coord: Coord
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

enum Country: String, Codable {
    case hk = "HK"
    case jp = "JP"
    case kr = "KR"
    case us = "US"
}

enum State: String, Codable {
    case ca = "CA"
    case empty = ""
    case tx = "TX"
}

typealias Cities = [City]
