//
//  WeatherManager.swift
//  Clima
//
//  Created by Monica Iqbal on 2020-10-08.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

// create protocol for WVC to adopt
// have didUpdateWeather in WVC to be notified of any updates to weather data
protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    
    // pass errors out of WM
    func didFailWithError(error: Error)
}

struct WeatherManager {
    // NOTE TO USERS: REPLACE "YOUR API KEY HERE" WITH YOUR UNIQUE API KEY FROM OPENWEATHERMAP:
    // https://openweathermap.org/api for more info.
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=(YOUR API KEY HERE)&units=metric"
    
    var delegate: WeatherManagerDelegate?
        
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    // can have duplicate method names in swift
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // 1. creater a URL
        if let url = URL(string: urlString) {
            // 2. create a URL session
            let session = URLSession(configuration: .default)
            
            // 3. give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
//                    print(error!) // error is optional so we must unwrap it
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)//referring to delegate in current class
                    }
                }
            }
            
            // 4. start the task
            task.resume()
        }
    }
    
    // get location id, temperature, name, and weather from JSON
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
