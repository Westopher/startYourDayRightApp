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
    
    func createUrl() {
        var latitude: String = ""
        var longitude: String = ""
        var sampleAPICall = "http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID=61fe2713c932b2a01162cf784e550f91"
        var appID = "61fe2713c932b2a01162cf784e550f91"
    
        let weatherURL = "\(sampleAPICall)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

   

}
