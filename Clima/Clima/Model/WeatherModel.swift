//
//  WeatherModel.swift
//  Clima
//
//  Created by Monica Iqbal on 2020-10-12.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    // convert temp to a string formatted to 1dp
    var tempOneDecimal: String {
        return String(format: "%.1f", temperature)
    }
    
    // computed property
    // work out value based on swtich statement
    var conditionName: String {
        switch conditionId {
        case 200...232: // thunderstorm
            return "cloud.bolt"
        case 300...321: // drizzle
            return "cloud.drizzle.fill"
        case 500...531: // rain
            return "cloud.rain"
        case 600...622: // snow
            return "snow"
        case 701...781: // atmosphere
            return "cloud.fog.fill"
        case 800: // clear
            return "sun.max.fill"
        case 801...804: // clouds
            return "cloud.fill"
        default:
            return "cloud"
        }
    }

}
