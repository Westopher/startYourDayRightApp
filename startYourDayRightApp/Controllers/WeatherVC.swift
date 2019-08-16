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
    
    @IBOutlet weak var tempDisplay: UILabel!
    @IBOutlet weak var tempDisplayLabel: UILabel!
    
    var locationManager = CLLocationManager()
    
    func getWeatherJSON() {
        //var latitude: String = ""
        //var longitude: String = ""
        var sampleAPICall = "http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&APPID=61fe2713c932b2a01162cf784e550f91"
        //var appID = "61fe2713c932b2a01162cf784e550f91"
        
        let weatherURL = "\(sampleAPICall)"
        
        guard let url = URL(string: weatherURL) else { return print("could not get url") }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil && data != nil {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(RootWeather.self, from: data!)
                    DispatchQueue.main.async {
                        
                       // result.main?.tempMax != nil, result.main?.tempMin != nil
                        
                        //temp
                        if result.main?.temp != nil  {
                            let tempResult = Int((result.main?.temp)! - 273.15)
                            self.tempDisplay.text = "\(String(tempResult)) °C"
                            print(tempResult)
                        } else {
                            print("result of api call was was nil")
                        }
                        
                        //maxtemp
                        if result.main?.tempMax != nil {
                            let tempMaxResult = Int((result.main?.tempMax)! - 273.15)
                            print("\(tempMaxResult)")
                        } else {
                            print("no temp max")
                        }
                        
                        //mintemp
                        if result.main?.tempMin != nil {
                            let tempMinResult = Int((result.main?.tempMin)! - 273.15)
                            print("\(tempMinResult)")
                        } else {
                            print("no temp max")
                        }
                        
                        
                    }
                } catch {
                    print("could not decode the JSON")
                    return
                }
            }
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherJSON()
        
    }

}
