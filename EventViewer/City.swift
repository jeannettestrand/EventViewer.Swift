//
//  City.swift
//  EventViewer
//
//  Created by Jeannette on 2018-03-01.
//  Copyright © 2018 Jeannette. All rights reserved.
//
import UIKit
import os

class City {
    var cityName: String
    var cityImage: UIImage
    var long: Double
    var lat: Double
    
    //MARK : Initialization of class parameters
    init?(cityName: String, cityImage: UIImage, long: Double, lat: Double) {
        self.cityName = cityName
        self.cityImage = cityImage
        self.long = long
        self.lat = lat
    }
}
