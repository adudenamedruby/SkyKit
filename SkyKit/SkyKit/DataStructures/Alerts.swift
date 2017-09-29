//
//  Alerts.swift
//  SkyKit
//
//  Created by roux on 2017-09-27.
//  Copyright © 2017 ACME|labs. All rights reserved.
//

import Foundation

/// The alerts array contains objects representing the severe weather warnings issued for the requested location by a governmental authority (based on DarkSky's own sources).
public struct Alerts {
    
    /// A detailed description of the alert.
    public let description:                 String
    
    /// The time at which the alert will expire.
    public let expiresOn:                     Date
    
    /// An array of strings representing the names of the regions covered by this weather alert.
    public let regions:                     [String]
    
    /// The severity of the weather alert. Will take one of the following values: "advisory" (an individual should be aware of potentially severe weather), "watch" (an individual should prepare for potentially severe weather), or "warning" (an individual should take immediate action to protect themselves and others from potentially severe weather).
    public let severity:                    String
    
    /// The time at which the alert was issued.
    public let timeIssued:                  Date
    
    /// A brief description of the alert.
    public let title:                       String
    
    /// An HTTP(S) URI that one may refer to for detailed information about the alert.
    public let uri:                         URL
    
    /// Creates a new Alert from a JSON object.
    ///
    /// - parameter json: A JSON object with keys corresponding to the Alert object's properties.
    ///
    /// - returns: A new Alert filled with data from the provided JSON object.
    public init(fromJSONData json: NSDictionary) {
        self.title                  = json["title"] as! String
        self.description            = json["description"] as! String
        self.uri                    = URL(string: json["uri"] as! String)!
        self.severity               = json["severity"] as! String
        self.regions                = json["regions"] as! [String]
        
        let jsonExpires             = json["expires"] as! Double
        self.expiresOn              = Date(timeIntervalSince1970: jsonExpires)
        
        let jsonIssued              = json["issued"] as! Double
        self.timeIssued             = Date(timeIntervalSince1970: jsonIssued)
            
    }
}
