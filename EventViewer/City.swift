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
    
    //MARK : Initialization of class parameters
    init?(cityName: String, cityImage: UIImage) {
        self.cityName = cityName
        self.cityImage = cityImage
    }
}
