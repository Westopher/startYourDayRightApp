//
//  WeatherVC.swift
//  startYourDayRightApp
//
//  Created by West Kraemer on 8/13/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {
    
    @IBOutlet weak var tempDisplayLabel: UILabel!
    
    
    func getWeatherJSON() {
        //var latitude: String = ""
        //var longitude: String = ""
        var sampleAPICall = "http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID=61fe2713c932b2a01162cf784e550f91"
        //var appID = "61fe2713c932b2a01162cf784e550f91"
        
        let weatherURL = "\(sampleAPICall)"
        
        guard let url = URL(string: sampleAPICall) else { return print("could not get url") }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if error == nil && data != nil {
                do {
                    let decoder = JSONDecoder()
                    let result = 
                    
                } catch {
                    print("could not decode the JSON")
                    return
                }
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

   

}
