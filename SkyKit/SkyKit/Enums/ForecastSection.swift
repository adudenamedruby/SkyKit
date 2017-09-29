//
//  ForecastSection.swift
//  SkyKit
//
//  Created by roux g. buciu on 2017-09-28.
//  Copyright © 2017 ACME|labs. All rights reserved.
//

import Foundation

/// Data fields associated with a Forecast object.
public enum ForecastSection: String {
    
    /// Current weather conditions.
    case currently = "currently"
    
    /// Minute-by-minute weather conditions for the next hour.
    case minutely = "minutely"
    
    /// Hour-by-hour weather conditions for the next two days by default but can be exte1nded to one week.
    case hourly = "hourly"
    
    /// Day-by-day weather conditions for the next week.
    case daily = "daily"
    
    /// Severe weather alerts.
    case alerts = "alerts"
    
    /// Miscellaneous metadata.
    case flags = "flags"
}
