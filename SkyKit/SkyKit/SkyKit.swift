//
//  SkyKit.swift
//  SkyKit
//
//  Created by roux on 2017-09-28.
//  Copyright © 2017 ACME|labs. All rights reserved.
//

import Foundation

/// The main class throught which one would interact with the DarkSky API.
open class SkyKit: NSObject {
    
    // MARK: - Variables
    
    private let apiKey:             String
    private let session             = URLSession.shared
    private static let darkSkyURL   = "https://api.darksky.net/forecast/"
    
    /// Specify the units of the returned response. Default is US units, as per DarkSky API implementation.
    open var units:                 Units?
    
    /// The language in which DataBlock and DataPoint summaries are return in. English is default.
    open var language:              Languages?
    
    
    // MARK: - Public Methods
    
    /// Creates a new SkyKit object to make calls to the DarkSky API.
    ///
    /// - parameter key: Your Dark Sky API key.
    ///
    /// - returns: A SkyKit object configured to interact with the Dark Sky API with your API key.
    public init(apiKey key: String) {
        self.apiKey                 = key
    }
    
    /// Retrieves the current forecast at a specified latitude and longitude.
    ///
    /// - parameter lat:           Latitude.
    /// - parameter lon:           Longitude.
    /// - parameter extendHourly:  When present, return hour-by-hour data for the next 168 hours, instead of the next 48. Warning: this massively increases the amount of data returned. Defaults is false.
    /// - parameter excludeBlocks: An array of blocks to exclude from the API's response. Defaults to an empty array. Exclusion options are of ForecastSection type.
    /// - parameter completion:    A block that returns the forecast at the latitude and longitude specified, or an error.
    open func getForecast(latitude lat: Double, longitude lon: Double, extendHourly: Bool = false, excludeBlocks: [ForecastSection] = [], completion: @escaping (Result<Forecast>) -> Void) {
        
        let url = buildForecastURL(latitude: lat,
                                   longitude: lon,
                                   time: nil,
                                   extendHourly: extendHourly,
                                   excludeBlocks: excludeBlocks)
        getForecast(url: url, completionHandler: completion)
    }
    
    /// Retrieves a Forecast` at a specified latitude, longitude, and time.
    ///
    /// - parameter lat:           Latitude.
    /// - parameter lon:           Longitude.
    /// - parameter time:          Time at which to get the `Forecast`. If no timezone is specified, local time (at the specified latitude and longitude) will be assumed.
    /// - parameter excludeBlocks: An array of blocks to exclude from the API's response. Defaults to an empty array. Exclusion options are of ForecastSection type.
    /// - parameter completion:    A block that returns the forecast at the latitude and longitude specified, or an error.
    open func getForecast(latitude lat: Double, longitude lon: Double, time: Date, excludeBlocks: [ForecastSection] = [], completion: @escaping (Result<Forecast>) -> Void) {
        
        let url = buildForecastURL(latitude: lat,
                                   longitude: lon,
                                   time: time,
                                   extendHourly: false,
                                   excludeBlocks: excludeBlocks)
        getForecast(url: url, completionHandler: completion)
    }
    
    
    // MARK: - Private methods
    
    private func getForecast(url: URL, completionHandler: @escaping (Result<Forecast>) -> Void) {
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("gzip", forHTTPHeaderField: "Accept-Encoding")
        
        let task = self.session.dataTask(with: urlRequest, completionHandler: { (data: Data?, response, err: Error?) -> Void in
            
            if let err = err {
                completionHandler(Result.failure(err))
                
            } else {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data!,
                                                                      options: .mutableContainers)
                    if let json = jsonObject as? NSDictionary, let httpURLResponse = response as? HTTPURLResponse {
                        let forecast = Forecast(fromJSONData: json)
                        let metadata = Metadata(fromHTTPHeaderFields: httpURLResponse.allHeaderFields)
                        completionHandler(Result.success(forecast, metadata))
                    }
                    
                } catch _ {
                    let invalidJSONError = RequestError.invalidJSON(data!)
                    completionHandler(Result.failure(invalidJSONError))
                }
            }
        })
        task.resume()
    }
    
    private func buildForecastURL(latitude lat: Double, longitude lon: Double, time: Date?, extendHourly: Bool, excludeBlocks: [ForecastSection]) -> URL {
        
        //  Build URL path
        var urlString = SkyKit.darkSkyURL + apiKey + "/\(lat),\(lon)"
        
        if let time = time {
            let timeString = String(format: "%.0f", time.timeIntervalSince1970)
            urlString.append(",\(timeString)")
        }
        
        //  Build URL query parameters
        var url                             = URLComponents(string: urlString)!
        var queryItems: [URLQueryItem]      = []
        
        if let units = self.units {
            queryItems.append(URLQueryItem(name: "units", value: units.rawValue))
        }
        
        if let language = self.language {
            queryItems.append(URLQueryItem(name: "lang", value: language.rawValue))
        }
        
        if extendHourly {
            queryItems.append(URLQueryItem(name: "extend", value: "hourly"))
        }
        
        if !excludeBlocks.isEmpty {
            var excludeBlocksString = ""
            for field in excludeBlocks {
                if excludeBlocksString != "" {
                    excludeBlocksString.append(",")
                }
                excludeBlocksString.append("\(field.rawValue)")
            }
            queryItems.append(URLQueryItem(name: "exclude", value: excludeBlocksString))
        }
        
        url.queryItems = queryItems
        
        return url.url!
    }
}
