//
//  WeatherAPI.swift
//  WeatherForecast
//
//  Created by Puneet Mahali on 16.06.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

private let baseUrlForCurrentWeather = URL(string: "https://api.openweathermap.org/data/2.5/weather")!
private let apiKey = "fc77b1df1209bc2f1129a1f2fa1b3d77"
private let baseUrlForWeekelyWeather = URL(string: "https://api.openweathermap.org/data/2.5/forecast/daily")!

private var decoder: JSONDecoder {
    let decode = JSONDecoder()
    decode.keyDecodingStrategy = .convertFromSnakeCase
    return decode
}

import SwiftUI

class WeatherAPI {
    
    class func fetchCurrentWeather(by city: String, onSuccess: @escaping (Weather) -> Void) {
        let query = ["q": "\(city)", "apiKey": apiKey, "units": "Imperial"]
        guard let url = baseUrlForCurrentWeather.withQueries(query) else {
            fatalError()
        }
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data, err == nil else {
                fatalError(err!.localizedDescription)
            }
            do {
                let weather = try decoder.decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    onSuccess(weather)
                }
            }
            catch {
                fatalError(error.localizedDescription)
            }
        }.resume()
    }
}

extension URL {
    func withQueries(_ queries: [String:String]) -> URL? {
        guard var component = URLComponents(url: self, resolvingAgainstBaseURL: true)
            else {
                fatalError()
        }
        component.queryItems = queries.map{ URLQueryItem(name: $0.key, value: $0.value) }
        return component.url
    }
}
