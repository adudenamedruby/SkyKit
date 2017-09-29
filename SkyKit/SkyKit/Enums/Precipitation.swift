//
//  Precipitation.swift
//  SkyKit
//
//  Created by roux on 2017-09-26.
//  Copyright © 2017 ACME|labs. All rights reserved.
//

import Foundation

/// Types of precipitation.
public enum Precipitation: String {
    
    /// Rain.
    case rain = "rain"
    
    /// Snow.
    case snow = "snow"
    
    /// Sleet (which refers to each of freezing rain, ice pellets, and “wintery mix”).
    case sleet = "sleet"
    
    /// Hail.
    case hail = "hail"
}
