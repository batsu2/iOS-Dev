//
//  NIUBuilding.swift
//  Butz_CampusWalk
//
//  Created by Bryan Butz on 11/15/18.
//  Copyright © 2018 Bryan Butz. All rights reserved.
//

import UIKit
import Foundation

class NIUBuilding: NSObject, Decodable
{
    var Number:String?
    var BuildingName:String?
    var BuildingCode:String?
    var City:String?
    var State:String?
    var Latitude:String?
    var Longitude:String?
    var BuildingImage:String?
    var Facts:String?
    
    // Setup initialization method
    init(Number: String, BuildingName: String, BuildingCode: String, City: String, State: String, Latitude: String, Longitude: String, BuildingImage: String, Facts: String )
    {
        self.Number = Number
        self.BuildingName = BuildingName
        self.BuildingCode = BuildingCode
        self.City = City
        self.State = State
        self.Latitude = Latitude
        self.Longitude = Longitude
        self.BuildingImage = BuildingImage
        self.Facts = Facts
    }
    
}
