
import Foundation

// MARK: - MyWeather
struct MyWeather: Decodable {
    let list: [Lists]?
    let city: WeatherCity?
}

// MARK: - City
struct WeatherCity: Decodable {
    let id: Int?
    let name: String?
    let coord: WeatherCoord?
    let country: String?
    let population, timezone, sunrise, sunset: Int?
}

// MARK: - Coord
struct WeatherCoord: Decodable {
    let lat, lon: Double?
}

// MARK: - List
struct Lists: Decodable {
    let dt: Int?
    let main: MainClass?
    let weather: [Weather]?
    let clouds: Clouds?
    let wind: Wind?
    let visibility: Int?
    let pop: Double?
    let rain: Rain?
    let sys: Sys?
    let dtTxt: String?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, rain, sys
        case dtTxt = "dt_txt"
    }
}

// MARK: - Clouds
struct Clouds: Decodable {
    let all: Int?
}

// MARK: - MainClass
struct MainClass: Decodable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, seaLevel, grndLevel, humidity: Int?
    let tempKf: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
struct Rain: Decodable {
    let the3H: Double?

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Sys
struct Sys: Decodable {
    let pod: Pod?
}

enum Pod: String, Decodable {
    case d = "d"
    case n = "n"
}

// MARK: - Weather
struct Weather: Decodable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
}

// MARK: - Wind
struct Wind: Decodable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}
