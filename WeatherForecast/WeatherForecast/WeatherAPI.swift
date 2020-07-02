//
//  WeatherAPI.swift
//  WeatherForecast
//
//  Created by Puneet Mahali on 16.06.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

private let baseUrlForCurrentWeather = URL(string: "https://api.openweathermap.org/data/2.5/weather")!
private let apiKey = "30364eed45e6fc3c6bc5827adbd43ef7"
private let baseUrlForWeeklyWeather = URL(string: "https://api.openweathermap.org/data/2.5/forecast/daily")!

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
        print("The url is: \(url)")
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
                //fatalError(error.localizedDescription)
                //print("\nErr", error.localizedDescription)
                print(error)
            }
        }.resume()
    }

    //weekly weahter func
        class func weeklyWeather(_ city: String, onSuccess: @escaping (WeeklyWeather) -> Void) {
            let query = ["q": "\(city)", "apiKey": apiKey, "units": "Imperial", "cnt": "7"]
            guard baseUrlForWeeklyWeather.withQueries(query) != nil else { fatalError("Invalid URL for weekly weather")}
            guard let url = baseUrlForWeeklyWeather.withQueries(query) else { fatalError() }

            URLSession.shared.dataTask(with: url) { data, res, err in
                guard let data = data, err == nil else {
                    fatalError(err!.localizedDescription)
                }
                print("Weekly url: \(url)")

                do {
                    let weather = try decoder.decode(WeeklyWeather.self, from:data)
                    DispatchQueue.main.async {
                        onSuccess(weather)
                    }
                }
                catch {
                    //fatalError(error.localizedDescription)
                    print(error)
                }
            }.resume()
     }
  }
