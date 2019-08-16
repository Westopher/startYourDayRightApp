//
//  WeatherVC.swift
//  startYourDayRightApp
//
//  Created by West Kraemer on 8/13/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherVC: UIViewController {
    
    //weather display outlets
    @IBOutlet weak var tempDisplay: UILabel!
    @IBOutlet weak var maxTempDisplay: UILabel!
    @IBOutlet weak var minTempDisplay: UILabel!
    @IBOutlet weak var humidityDisplay: UILabel!
    @IBOutlet weak var descriptionDisplay: UILabel!
    
    
    var locationManager = CLLocationManager()
    
    func getWeatherJSON() {
        //var latitude: String = ""
        //var longitude: String = ""
        let sampleAPICall = "http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&APPID=61fe2713c932b2a01162cf784e550f91"
        //var appID = "61fe2713c932b2a01162cf784e550f91"
        
        let weatherURL = "\(sampleAPICall)"
        
        guard let url = URL(string: weatherURL) else { return print("could not get url") }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil && data != nil {
               
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(RootWeather.self, from: data!)
                    DispatchQueue.main.async {
                        
                        //temp
                        if result.main?.temp != nil  {
                            let tempResult = Int((result.main?.temp)! - 273.15)
                            self.tempDisplay.text = "\(String(tempResult)) °C"
                            print(tempResult)
                        } else {
                            print("result of api call was was nil")
                        }
                        
                        //maxtemp
                        if result.main?.temp_max != nil {
                            let tempMaxResult = Int((result.main?.temp_max)! - 273.15)
                            self.maxTempDisplay.text = "\(String(tempMaxResult)) °C"
                            print("\(tempMaxResult)")
                        } else {
                            print("no temp max")
                        }
                        
                        //mintemp
                        if result.main?.temp_min != nil {
                            let tempMinResult = Int((result.main?.temp_min)! - 273.15)
                            self.minTempDisplay.text = "\(String(tempMinResult)) °C"
                            print("\(tempMinResult)")
                        } else {
                            print("no temp max")
                        }
                        
                        //humidity
                        if result.main?.humidity != nil {
                            let humidity = Int((result.main?.humidity)!)
                            self.humidityDisplay.text = "\(String(humidity))%"
                            print("\(humidity)")
                        } else {
                            print("no humidity")
                        }
                        
                        //description
                        if result.weather?[0].description != nil {
                            let description = String((result.weather?[0].description)!)
                            self.descriptionDisplay.text = "\(String(description.uppercased()))."
                            print("\(description)")
                        } else {
                            print("no description")
                        }
                        
                        print(result.weather?[0].description)
                        print(result.weather?[0].id)
                    }
                } catch {
                    print("could not decode the JSON")
                    return
                }
            }
        }.resume()
    
    func updateWeatherIcon(condition: Int) -> String {
        
        switch (condition) {
            
        case 0...300 :
            return "tstorm1"
            
        case 301...500 :
            return "light_rain"
            
        case 501...600 :
            return "shower3"
            
        case 601...700 :
            return "snow4"
            
        case 701...771 :
            return "fog"
            
        case 772...799 :
            return "tstorm3"
            
        case 800 :
            return "sunny"
            
        case 801...804 :
            return "cloudy2"
            
        case 900...903, 905...1000  :
            return "tstorm3"
            
        case 903 :
            return "snow5"
            
        case 904 :
            return "sunny"
            
        default :
            return "no data available for these conditions"
        }
        
    }
    
    
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherJSON()
        
    }
    

}
