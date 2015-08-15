//
//  HttpGetController.swift
//  Watchpods
//
//  Created by 沈家瑜 on 15/8/15.
//  Copyright (c) 2015年 沈家瑜. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

struct City {
    let city: String
    let weather: String
    let temp : String
    let date: String
}

class HttpGetController: NSObject {
    func getInformation(cityName: String, completion: (City) -> Void) {
        Alamofire.request(.GET, "http://apis.baidu.com/apistore/weatherservice/cityname", parameters: ["cityname": cityName], headers: ["apikey": "14f99e26b9bc57a36970ddd09e0b9264"]).responseJSON(options: NSJSONReadingOptions.MutableContainers) { (_, _, json, _) -> Void in
            if let getJson: AnyObject = json {
                let j = JSON(getJson)
                let j1 = j["retData"]
                    if let city = j1["city"].string, date = j1["date"].string, temp = j1["temp"].string, weather = j1["weather"].string {
                        completion(City(city: city, weather: weather, temp: temp, date: date))
                }
            }
        }
    }
}
