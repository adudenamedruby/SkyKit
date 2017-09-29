//
//  Icon.swift
//  SkyKit
//
//  Created by roux g. buciu on 2017-09-26.
//  Copyright © 2017 ACME|labs. All rights reserved.
//

import Foundation

/// This accounts for the different types of weather conditions. Ensure that a sensible default is chosen as additional values, such as "hail", etc., may be defined by the DarkSky API in the future.
public enum Icon: String {
    
    /// A clear day.
    case clearDay = "clear-day"
    
    /// A clear night.
    case clearNight = "clear-night"
    
    /// A day or night wherein it predominantly rains.
    case rain = "rain"
    
    /// A day or night wherein it predominantly snows.
    case snow = "snow"
    
    /// A day or night with sleet.
    case sleet = "sleet"
    
    /// A day or night that is quite windy.
    case wind = "wind"
    
    /// A day or night made mysterious by fog.
    case fog = "fog"
    
    /// A day or night that's overcast.
    case cloudy = "cloudy"
    
    /// A day that's partially overcast.
    case partlyCloudyDay = "partly-cloudy-day"
    
    /// A night that's partially overcast.
    case partlyCloudyNight = "partly-cloudy-night"
}
