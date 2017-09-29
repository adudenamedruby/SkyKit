//
//  DataBlock.swift
//  SkyKit
//
//  Created by roux g. buciu on 2017-09-27.
//  Copyright © 2017 ACME|labs. All rights reserved.
//

import Foundation

/// A data block object represents the various weather phenomena occurring over a period of time.
public struct DataBlock {
    
    /// An array of data points, ordered by time, which together describe the weather conditions at the requested location over time.
    public let data:                   [DataPoint]
    
    
    /// A human-readable summary of this data block.
    public let summary:                String?
    
    /// A machine-readable text summary of this data block. (May take on the same values as the iconproperty of data points.)
    public let icon:                   Icon?
    
    
    /// Creates a DataBlock object from provided JSON object.
    ///
    /// - Parameter json: A JSON object that has keys corresponding to the DataBlock object's properties.
    ///
    /// - returns: A filled DataBlock object, unpacked from the provided JSON object.
    public init(fromJSONData json: NSDictionary) {
        
        self.summary                    = json["summary"] as? String
        if let jsonIcon = json["icon"] as? String {
            icon                        = Icon(rawValue: jsonIcon)
        } else {
            icon                        = nil
        }
        
        let jsonData = json["data"] as! [NSDictionary]
        var tempData = [DataPoint]()
        for dataPoint in jsonData {
            tempData.append(DataPoint(fromJSONData: dataPoint))
        }
        self.data                       = tempData
    }
}
