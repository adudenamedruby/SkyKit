//
//  RequestError.swift
//  SkyKit
//
//  Created by roux on 2017-09-29.
//  Copyright © 2017 ACME|labs. All rights reserved.
//

import Foundation

/// Represents errors in interacting with the Dark Sky API.
public enum RequestError: Error {
    
    /// Error due to invalid JSON.
    case invalidJSON(Data)
}
