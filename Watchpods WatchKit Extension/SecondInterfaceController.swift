//
//  SecondInterfaceController.swift
//  Watchpods
//
//  Created by 沈家瑜 on 15/8/15.
//  Copyright (c) 2015年 沈家瑜. All rights reserved.
//

import WatchKit
import Foundation


class SecondInterfaceController: WKInterfaceController {
    let citys = ["宁波", "临安", "杭州", "上海", "北京", "深圳"]

    @IBOutlet weak var table: WKInterfaceTable!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        table.setNumberOfRows(citys.count, withRowType: "CityRow")
        for (index, value) in enumerate(citys) {
            let row = table.rowControllerAtIndex(index) as! CityRow
            row.labelCityName.setText(value)
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        cityNameTotal = citys[rowIndex]
        WKInterfaceController.reloadRootControllersWithNames(["First", "Second"], contexts: nil)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
