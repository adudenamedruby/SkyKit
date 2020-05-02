# SkyKit
A easy to use library for retrieving weather data from the DarkSky API.

![Swift](http://img.shields.io/badge/swift-4.0-brightgreen.svg)

NOTE: As the DarkSky API will be depracated since Apple acquired DarkSky, this library is no longer being maintained.


### Requirements

To access the DarkSky API, SkyKit requires an API key, which you can get [here](https://darksky.net/dev/).


### Installation

SkyKit is currently only available as a manual install. To use it: build the framework, and then drag the framework into your project folder and add it in the Link Library With Binary. Or just copy the files into your project.


### Documentation & Unit Tests

SkyKit is fully documented. Enjoy! :D
Unit tests... will be updated soon!


### DarkSky API Responses

When using SkyKit, you will receive metadata and a `Forecast` object. This object will have all the fields provided by the DarkSky API conveniently broken down into `DataPoint` and `DataBlock` objects. A `DataPoint` object contains various properties, each representing the average (unless otherwise specified) of a particular weather phenomenon occurring during a period of time: an instant in the case of `currently`, a minute for `minutely`, an hour for `hourly`, and a day for `daily`. A `DataBlock` object represents the various weather phenomena occurring over a period of time - these will be the `minutely`, `hourly`, and `daily` propertios DarkSky sends. They are composed of arrays of `DataPoints`.

`DataPoint`s and `DataBlock`s both contain a very large amount of information. If you would like to, because you may have no need for some of the fields DarkSky returns, any of these fields can be excluded from the API response through the `excludeBlocks` parameter of the `getForecast` methods. `excludeBlocks` is optional and defaults to an empty array; in other words, by default, you will receive everything! Use `ForecastSection` variables to populate the array.

DarkSky's API also allows you to recevie more data (default is 48 hours, but you can receive up to 168 hours of data) if you want it. To do this, set the `extendHourly` parameter of the `getForecast` method to `true` to make the `hourly` property on `Forecast` return hourly data for a full week. `extendHourly` is an optional parameter and defaults to `false` and is not available on TimeMachine requests.


### Using SkyKit

First, import SkyKit (if using as a framework), then create a SkyKit object and provide your API key:

```swift
import SkyKit
...
let skyKitClient = SkyKit(apiKey: "YOUR_API_KEY_HERE")
```

You can choose units that you want responses to use. For a full list of the supported units, please see the DarkSky documentation [here](https://darksky.net/dev/docs/forecast). Here is the use case:

```swift
skyKitClient.units = .si
```


You may also specify the language that you want to receive summary responses in. All languages supported by the DarkSky API, as of September 2017, are currently supported. A full list is available [here](https://darksky.net/dev/docs/forecast)). English is the default language. Here is the use case.

```swift
skyKitClient.language = .spanish
```


With the SkyKit, you can make two kinds of requests. The first kind will get the current `Forecast` for a particular location. The following example also includes the `extendHourly` and `excludeBlocks` parameters:

```swift
skyKitClient.getForecast(latitude: someLatitude, longitude: someLongitude, extendHourly: true, excludeBlocks: [.hourly]) { result in
    switch result {
    case .success(let currentForecast, let metadata):
        //  Data retrieval was successful. You may do what you like with the currentForecast and the metadata objects.
    case .failure(let error):
        //  Something went terribly wrong! Run away!
    }
}
```

The second kind of request is called a TimeMachine request, and it will get a `Forecast` for a particular location at a particular time:

```swift
skyKitClient.getForecast(latitude: someLatitude, longitude: someLongitude, time: someTime) { result in
    switch result {
    case .success(let forecast, let metadata):
        //  Data retrieval was successful. You may do what you like with the currentForecast and the metadata objects.
    case .failure(let error):
        //   Something went terribly wrong! Run away again!
    }
}
```


## Author

roux g. buciu


## License

Copyright 2017 roux g. buciu

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
