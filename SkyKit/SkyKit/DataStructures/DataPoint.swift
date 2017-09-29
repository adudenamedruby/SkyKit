//
//  DataPoint.swift
//  SkyKit
//
//  Created by roux g. buciu on 2017-09-26.
//  Copyright © 2017 ACME|labs. All rights reserved.
//

import Foundation

/// A data point object will contain various properties, each representing the average (unless otherwise specified) of a particular weather phenomenon occuring during a period of time: this instant in the case of 'currently', a minute for 'minutely', and a day for 'daily'.
public struct DataPoint {
    
    /// The apparent (or "feels like") temperature in Farenheit.
    /// Not available for: 'daily'
    public let apparentTemperature:                     Float?
    
    /// The daytime high apparent temperature.
    /// Only available for: 'daily'
    public let apparentTemperatureHigh:                 Float?
    
    /// The time representing when the daytime high apparent temperature occurs.
    /// Only available for: 'daily'
    public let apparentTemperatureHighTime:             Date?
    
    /// The overnight low apparent temperature.
    /// Only available for: 'daily'
    public let apparentTemperatureLow:                  Float?
    
    /// The time representing when the overnight low apparent temperature occurs.
    /// Only available for: 'daily'
    public let apparentTemperatureLowTime:              Date?
    
    /// The percentage of sky occluded by clouds, between 0 and 1, inclusive.
    public let cloudCover:                              Float?
    
    /// The daytime high temperature.
    /// Only available for: 'daily'
    public let dailyTemperatureHigh:                    Float?
    
    /// The time representing when the daytime high temperature occurs.
    /// Not available for:
    public let dailyTemperatureHighTime:                Date?
    
    /// The overnight low temperature.
    /// Only available for: 'daily'
    public let dailyTemperatureLow:                     Float?
    
    /// The time representing when the overnight low temperature occurs.
    /// Not available for:
    public let dailyTemperatureLowTime:                 Date?
    
    /// The dew point in degrees Fahrenheit.
    public let dewPoint:                                Float?
    
    /// The relative humidity, between 0 and 1, inclusive.
    /// Not available for:
    public let humidity:                                Float?
    
    /// A readable text summary of this data point, suitable for selecting an icon for display. This property will have one of the following values: clear-day, clear-night, rain, snow, sleet, wind, fog, cloudy, partly-cloudy-day, or partly-cloudy-night.
    public let icon:                                    Icon?
    
    /// The fractional part of the lunation number during the given day: a value of 0 corresponds to a new moon, 0.25 to a first quarter moon, 0.5 to a full moon, and 0.75 to a last quarter moon. (The ranges in between these represent waxing crescent, waxing gibbous, waning gibbous, and waning crescent moons, respectively.)
    /// Only available for: 'daily'
    public let moonPhase:                               Float?
    
    /// The approximate direction of the nearest storm in degrees, with true north at 0° and progressing clockwise. (If nearestStormDistance is zero, then this value will not be defined.)
    /// Only available for: 'currently'
    public let nearestStormBearing:                     Float?
    
    /// The approximate distance to the nearest storm in miles. (A storm distance of 0 doesn’t necessarily refer to a storm at the requested location, but rather a storm in the vicinity of that location.)
    /// Only available for: 'currently'
    public let nearestStormDistance:                    Float?
    
    /// The columnar density of total atmospheric ozone at the given time in Dobson units.
    public let ozone:                                   Float?
    
    /// The amount of snowfall accumulation expected to occur, in inches. (If no snowfall is expected, this property will not be defined.)
    /// Only available for: 'hourly', 'daily'
    public let precipitationAccumulation:               Float?
    
    /// The intensity (in inches of liquid water per hour) of precipitation occurring at the given time. This value is conditional on probability (that is, assuming any precipitation occurs at all) for minutely data points, and unconditional otherwise.
    public let precipitationIntensity:                  Float?
    
    /// The maximum value of precipIntensity during a given day.
    /// Only available for: 'daily'
    public let precipitationIntensityMax:               Float?
    
    /// The time of when precipIntensityMax occurs during a given day.
    /// Only available for: 'daily'
    public let precipitationIntensityMaxTime:           Date?
    
    /// The probability of precipitation occurring, between 0 and 1, inclusive.
    public let precipitationProbability:                Float?
    
    /// The type of precipitation occurring at the given time. If defined, this property will have one of the following values: "rain", "snow", or "sleet" (which refers to each of freezing rain, ice pellets, and “wintery mix”). (If precipIntensity is zero, then this property will not be defined. Additionally, due to the lack of data in DarkSky's sources, historical precipType information is usually estimated, rather than observed.)
    public let precipitationType:                       Precipitation?
    
    /// The sea-level air pressure in millibars.
    public let pressure:                                Float?
    
    /// A human-readable text summary of this data point. (This property has millions of possible values, so don’t use it for automated purposes: use the icon property, instead!)
    public let summary:                                 String?
    
    /// The time of when the sun will rise during a given day.
    /// Only available for: 'daily'
    public let sunriseTime:                             Date?
    
    /// The time of when the sun will set during a given day.
    /// Only available for: 'daily'
    public let sunsetTime:                              Date?
    
    /// The air temperature in degrees Fahrenheit.
    /// Not available for: 'minutely'
    public let temperature:                             Float?
    
    /// The  time at which this data point begins. minutely data point are always aligned to the top of the minute, hourly data point objects to the top of the hour, and daily data point objects to midnight of the day, all according to the local time zone.
    public let time:                                    Date?
    
    /// The UV index.
    public let uvIndex:                                 Float?
    
    /// The time of when the maximum uvIndex occurs during a given day.
    /// Only available for: 'daily'
    public let uvIndexTime:                             Date?
    
    /// The average visibility in miles, capped at 10 miles.
    public let visibility:                              Float?
    
    /// The direction that the wind is coming from in degrees, with true north at 0° and progressing clockwise. (If windSpeed is zero, then this value will not be defined.)
    public let windBearing:                             Float?
    
    /// The wind gust speed in miles per hour.
    public let windGust:                                Float?
    
    /// The wind speed in miles per hour.
    public let windSpeed:                               Float?
    
    
    /// Creates a DataPoint object from the provided JSON.
    ///
    /// - Parameter json: A JSON object whose values correspond to the DataPoint values which will be parsed.
    ///
    /// - returns: A new DataPoint object with all the information from the passed JSON.
    public init(fromJSONData json: NSDictionary) {
        // General
        self.time                   = Date(timeIntervalSince1970: json["time"] as! Double)
        self.summary                = json["summary"] as? String
        self.moonPhase              = json["moonPhase"] as? Float
        self.dewPoint               = json["dewPoint"] as? Float
        self.humidity               = json["humidity"] as? Float
        self.pressure               = json["pressure"] as? Float
        self.visibility             = json["visibility"] as? Float
        self.cloudCover             = json["cloudCover"] as? Float
        self.ozone                  = json["ozone"] as? Float
        self.uvIndex                = json["uvIndex"] as? Float
        
        if let jsonUVTime = json["uvIndexTime"] as? Double {
            self.uvIndexTime        = Date(timeIntervalSince1970: jsonUVTime)
        } else {
            self.uvIndexTime        = nil
        }
        
        if let jsonIcon = json["icon"] as? String {
            self.icon               = Icon(rawValue: jsonIcon)
        } else {
            self.icon               = nil
        }
        
        if let jsonSunriseTime = json["sunriseTime"] as? Double {
            self.sunriseTime        = Date(timeIntervalSince1970: jsonSunriseTime)
        } else {
            self.sunriseTime        = nil
        }
        
        if let jsonSunsetTime = json["sunsetTime"] as? Double {
            self.sunsetTime         = Date(timeIntervalSince1970: jsonSunsetTime)
        } else {
            self.sunsetTime         = nil
        }
        
        // Temperature
        self.temperature                = json["temperature"] as? Float
        self.dailyTemperatureLow        = json["temperatureLow"] as? Float
        self.dailyTemperatureHigh       = json["temperatureHigh"] as? Float
        self.apparentTemperature        = json["apparentTemperature"] as? Float
        self.apparentTemperatureLow     = json["apparentTemperatureLow"] as? Float
        self.apparentTemperatureHigh    = json["apparentTemperatureHigh"] as? Float
        
        if let jsonApparentTempHighTime = json["apparentTemperatureHighTime"] as? Double {
            self.apparentTemperatureHighTime    = Date(timeIntervalSince1970: jsonApparentTempHighTime)
        } else {
            self.apparentTemperatureHighTime    = nil
        }
        
        if let jsonApparentTempLowTime = json["apparentTemperatureLowTime"] as? Double {
            self.apparentTemperatureLowTime    = Date(timeIntervalSince1970: jsonApparentTempLowTime)
        } else {
            self.apparentTemperatureLowTime    = nil
        }
        
        if let jsonTempHighTime = json["temperatureHighTime"] as? Double {
            self.dailyTemperatureHighTime    = Date(timeIntervalSince1970: jsonTempHighTime)
        } else {
            self.dailyTemperatureHighTime    = nil
        }
        
        if let jsonTempLowTime = json["temperatureLowTime"] as? Double {
            self.dailyTemperatureLowTime    = Date(timeIntervalSince1970: jsonTempLowTime)
        } else {
            self.dailyTemperatureLowTime    = nil
        }
        
        
        // Wind
        self.windGust               = json["windGust"] as? Float
        self.windSpeed              = json["windSpeed"] as? Float
        self.windBearing            = json["windBearing"] as? Float
        self.nearestStormDistance   = json["nearestStormDistance"] as? Float
        self.nearestStormBearing    = json["nearestStormBearing"] as? Float
        
        // Precipitation
        self.precipitationIntensity     = json["precipIntensity"] as? Float
        self.precipitationIntensityMax  = json["precipIntensityMax"] as? Float
        self.precipitationProbability   = json["precipProbability"] as? Float
        self.precipitationAccumulation  = json["precipAccumulation"] as? Float

        if let jsonPrecipitationIntensityMaxTime = json["precipIntensityMaxTime"] as? Double {
            self.precipitationIntensityMaxTime = Date(timeIntervalSince1970: jsonPrecipitationIntensityMaxTime)
        } else {
            self.precipitationIntensityMaxTime = nil
        }
        
        if let jsonPrecipitationType = json["precipType"] as? String {
            self.precipitationType  = Precipitation(rawValue: jsonPrecipitationType)
        } else {
            self.precipitationType  = nil
        }
    }
}
