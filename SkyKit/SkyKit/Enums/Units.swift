//
//  Units.swift
//  SkyKit
//
//  Created by roux on 2017-09-27.
//  Copyright © 2017 ACME|labs. All rights reserved.
//

import Foundation

/// Units in which the Dark Sky API data will be returned.
public enum Units: String {
    
    /// Automatically use the appropriate units based on the location for which you are requesting data.
    case auto = "auto"
    
    /// Canadian units. Identical to .si except "windSpeed" is in kilometers per hour.
    case ca = "ca"
    
    /// UK units. Identical to .si except "windSpeed" is in miles per hour, and
    /// "nearestStormDistance" and "visibility" are in miles.
    case uk = "uk2"
    
    /// US units; the default option.
    case us = "us"
    
    /// SI units. More details are available in the [Dark Sky API docs](https://darksky.net/dev/docs#overview).
    case si = "si"
}
