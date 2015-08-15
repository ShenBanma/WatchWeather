//
//  InterfaceController.swift
//  Watchpods WatchKit Extension
//
//  Created by 沈家瑜 on 15/8/15.
//  Copyright (c) 2015年 沈家瑜. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var backGroup: WKInterfaceGroup!
    @IBOutlet weak var labelDate: WKInterfaceLabel!
    @IBOutlet weak var labelTemp: WKInterfaceLabel!
    @IBOutlet weak var labelWeather: WKInterfaceLabel!
    @IBOutlet weak var labelCity: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    func updateView() {
        let controller = HttpGetController()
        controller.getInformation(cityNameTotal, completion: { (city) -> Void in
            let cityName = city.city
            self.labelCity.setText(cityName)
            self.labelTemp.setText(city.temp + "℃")
            self.labelWeather.setText(city.weather)
            self.labelDate.setText(self.changeDate(city.date))
            self.backGroup.setBackgroundImageNamed(cityName)
        })
    }
    
    func changeDate(date: String) -> String {
        let df = NSDateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        let time = df.dateFromString(date)
        df.dateFormat = "MM-dd"
        return df.stringFromDate(time!)
    }
    

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        updateView()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

var cityNameTotal = "宁波"