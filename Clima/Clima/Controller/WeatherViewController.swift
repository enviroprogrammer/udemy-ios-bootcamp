//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

// delegate: the one who's notified about changes
// ui text field delegate is a PROTOCOL.
class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self // handles the text that user types in
        // text field should report back to view controller so it knows what's happening
        // recall: self refers to the current view controller
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // location is a private piece of data
        locationManager.requestLocation() // one time delivery of users current location.
        
        weatherManager.delegate = self // set current class as delegate
    }
}

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true) // done with editing, dismiss keyboard
        print(searchTextField.text!)
    }
    
    // process pressing of return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true) // done with editing, dismiss keyboard
        print(searchTextField.text!)
        return true
    }

    // decides what happens when user deselects text field
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" { // assume user typed something
            return true
        } else {
            // alert user that they have to type
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // use searchtextfield.text to get the weather for that city
        // then reset it to an empty string
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
            cityLabel.text = city // update city label to reflect changes
        } // optionally unwrap property
        searchTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.tempOneDecimal // add self b/c this is a closure
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName // change city label based on coordinates
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }

}

//MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    @IBAction func currentLocation(_ sender: UIButton) {
        if let currentLoc = locationManager.location {
            let lat = currentLoc.coordinate.latitude
            let lon = currentLoc.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        } // optionally unwrap location via optional binding
    }
        
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
