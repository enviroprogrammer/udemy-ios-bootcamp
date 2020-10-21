//
//  WeatherData.swift
//  Clima
//
//  Created by Monica Iqbal on 2020-10-09.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

// this can decode itself from an external representation (JSON)
// Encodable: encode Object to JSON
//
struct WeatherData: Codable {
    let name: String
    let main: Main
    let coord: Coord
    let weather: [Weather] // note: this is an array of weather items
    let clouds: Clouds
}

struct Main: Codable {
    let temp: Double
    let humidity: Int
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}

struct Clouds: Codable {
    let all: Int
}
