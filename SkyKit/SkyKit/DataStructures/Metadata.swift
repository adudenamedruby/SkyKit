//
//  Metadata.swift
//  SkyKit
//
//  Created by roux on 2017-09-28.
//  Copyright © 2017 ACME|labs. All rights reserved.
//

import Foundation

/// The API will set HTTP response headers with values useful to developers.
public struct Metadata {
    
    /// Set to a conservative value for data caching purposes based on the data present in the response body.
    public let cacheControl:                    String?
    
    /// Number of API requests made by the given API key for today.
    public let numberOfAPIRequestsToday:        Int?
    
    /// Server-side response time of the current request; returned in milliseconds.
    public let responseTime:                    Float?
    
    /// Creates a Metadata object from Dark Sky API response header fields.
    ///
    /// - parameter headerFields: A dictionary containing Dark Sky API response header fields.
    ///
    /// - returns: A new Metadata object filled with data from the given Dark Sky API response header fields.
    public init(fromHTTPHeaderFields headerFields: [AnyHashable: Any]) {
        self.cacheControl                       = headerFields["Cache-Control"] as? String
        
        if let apiCallsHeader = headerFields["X-Forecast-API-Calls"] as? String {
            self.numberOfAPIRequestsToday       = Int(apiCallsHeader)
        } else {
            self.numberOfAPIRequestsToday       = nil
        }
        
        if var responseTimeHeader = headerFields["X-Response-Time"] as? String {
            // Remove time units from the string
            responseTimeHeader  = responseTimeHeader.trimmingCharacters(in: CharacterSet.letters)
            self.responseTime                   = Float(responseTimeHeader)
        } else {
            self.responseTime                   = nil
        }
    }
}
