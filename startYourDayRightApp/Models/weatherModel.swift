//
//  weatherModel.swift
//  startYourDayRightApp
//
//  Created by West Kraemer on 8/14/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import Foundation


struct RootWeather: Decodable {
    var main: Main?
}

struct Main: Decodable {
    var humidity : Int?
    var pressure : Int?
    var temp : Float?
    var tempMax : Float?
    var tempMin : Float?
}

