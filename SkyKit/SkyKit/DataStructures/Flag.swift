//
//  FlagsObject.swift
//  SkyKit
//
//  Created by roux on 2017-09-27.
//  Copyright © 2017 ACME|labs. All rights reserved.
//

import Foundation

/// The flags object contains various metadata information related to the request.
public struct Flag {
    
    /// The presence of this property indicates that the Dark Sky data source supports the given location, but a temporary error (such as a radar station being down for maintenance) has made the data unavailable.
    public let darkSkyUnavailable:              Bool?
    
    /// Contains the IDs for each radar station used in servicing the `Forecast` request.
    public let darkSkyStations:                 [String]?
    
    /// Contains the IDs for each `DataPoint` station used in servicing this request.
    public let dataPointStations:               [String]?
    
    /// Contains the IDs for each ISD station used in servicing this request.
    public let isdStations:                     [String]?
    
    /// Contains the IDs for each LAMP station used in servicing this request.
    public let lampStations:                    [String]?
    
    /// Contains the IDs for each METAR station used in servicing this request.
    public let metarStations:                   [String]?
    
    /// The presence of this property indicates that data from api.met.no was used to facilitate this request (as per their license agreement).
    public let metnoLicense:                    Bool?
    
    /// This property contains an array of IDs for each data source utilized in servicing this request.
    public let sources:                         [String]
    
    /// Indicates the units which were used for the data in this request.
    public let units:                           Units
    
    /// Creates a new Flag from a passed JSON object.
    ///
    /// - parameter json: A JSON object with keys corresponding to the Flag object's properties.
    ///
    /// - returns: A Flag object filled with data from the given JSON data.
    public init(fromJSONData json: NSDictionary) {
        self.darkSkyUnavailable         = json["darksky-unavailable"] as? Bool
        self.darkSkyStations            = json["darksky-stations"] as? [String]
        self.dataPointStations          = json["datapoint-stations"] as? [String]
        self.isdStations                = json["isd-stations"] as? [String]
        self.lampStations               = json["lamp-stations"] as? [String]
        self.metarStations              = json["metar-stations"] as? [String]
        self.metnoLicense               = json["metno-license"] as? Bool
        self.sources                    = json["sources"] as! [String]
        self.units                      = Units(rawValue: json["units"] as! String)!
    }
}
