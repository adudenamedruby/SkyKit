//
//  Forecast.swift
//  SkyKit
//
//  Created by roux on 2017-09-28.
//  Copyright © 2017 ACME|labs. All rights reserved.
//

import Foundation

/// The weather data for a location at a specific time.
public struct Forecast {
    
    /// Severe weather `Alert`s issued by a governmental weather authority for the requested location.
    public let alerts:          [Alerts]?
    
    /// The daily weather conditions at the requested location for the next week aligned to midnight of the day.
    public let daily:           DataBlock?
    
    /// The current weather conditions at the requested location.
    public let currently:       DataPoint?
    
    /// Metadata for the request.
    public let flags:           Flag?
    
    /// The hourly weather conditions at the requested location for the next two days aligned to the top of the hour.
    public let hourly:          DataBlock?
    
    /// The minute-by-minute weather conditions at the requested location for the next hour aligned to the nearest minute.
    public let minutely:        DataBlock?
    
    /// The requested latitude.
    public let latitude:        Float
    
    /// The requested longitude.
    public let longitude:       Float
    
    /// The IANA timezone name for the requested location (e.g. "America/New_York"). Rely on local user settings over this property.
    public let timezone:        String
    
    /// Creates a new `Forecast` from a JSON object.
    ///
    /// - parameter json: A JSON object with keys corresponding to the `Forecast`'s properties.
    ///
    /// - returns: A new `Forecast` filled with data from the given JSON object.
    public init(fromJSONData json: NSDictionary) {
        latitude                = json["latitude"] as! Float
        longitude               = json["longitude"] as! Float
        timezone                = json["timezone"] as! String
        
        if let jsonCurrently = json["currently"] as? NSDictionary {
            currently           = DataPoint(fromJSONData: jsonCurrently)
        } else {
            currently           = nil
        }
        if let jsonMinutely = json["minutely"] as? NSDictionary {
            minutely            = DataBlock(fromJSONData: jsonMinutely)
        } else {
            minutely            = nil
        }
        if let jsonHourly = json["hourly"] as? NSDictionary {
            hourly              = DataBlock(fromJSONData: jsonHourly)
        } else {
            hourly              = nil
        }
        if let jsonDaily = json["daily"] as? NSDictionary {
            daily               = DataBlock(fromJSONData: jsonDaily)
        } else {
            daily               = nil
        }
        
        if let jsonAlerts = json["alerts"] as? [NSDictionary] {
            var tempAlerts      = [Alerts]()
            for jsonAlert in jsonAlerts {
                tempAlerts.append(Alerts(fromJSONData: jsonAlert))
            }
            alerts              = tempAlerts
        } else {
            alerts              = nil
        }
        
        if let jsonFlags = json["flags"] as? NSDictionary {
            flags               = Flag(fromJSONData: jsonFlags)
        } else {
            flags               = nil
        }
    }
}
