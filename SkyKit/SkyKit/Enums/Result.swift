//
//  Result.swift
//  SkyKit
//
//  Created by roux on 2017-09-28.
//  Copyright © 2017 ACME|labs. All rights reserved.
//

import Foundation

/// A representation of whether a request was successful or not.
public enum Result<Value> {
    
    /// The request and all post processing operations were successful.
    case success(Value, Metadata)
    
    /// The request encountered an error resulting in a failure.
    case failure(Error)
    
    /// Returns the associated value if the result is a success, `nil` otherwise.
    public var value: (Value?, Metadata?) {
        switch self {
        case .success(let value, let metadata):
            return (value, metadata)
        case .failure:
            return (nil, nil)
        }
    }
    
    /// Returns the associated error value if the result is a failure, `nil` otherwise.
    public var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}
