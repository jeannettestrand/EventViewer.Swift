//
//  conversions.swift
//  Template for Conversion objects for app data.
//
//  Created by Jeannette on 2018-02-18.
//  Copyright © 2018 Jeannette. All rights reserved.
//

import UIKit
import os

class Event {
    var eventName: String
    var locationLabel: String
    var eventInfo: String
    var eventDate: String
    var hostLabel: String
    var eventImage: UIImage
    
    //MARK : Initialization of class parameters
    init?(eventName: String, locationLabel: String, eventInfo: String, eventDate: String, hostLabel: String, eventImage: UIImage) {
        self.eventName = eventName
        self.locationLabel = locationLabel
        self.eventInfo = eventInfo
        self.eventDate = eventDate
        self.hostLabel = hostLabel
        self.eventImage = eventImage
    }
}

