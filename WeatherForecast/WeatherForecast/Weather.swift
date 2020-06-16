//
//  Weather.swift
//  WeatherForecast
//
//  Created by Puneet Mahali on 16.06.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let id, dt, cod, timezone: Int
    let name, base: String
    let coord: Coord
    let weather: [WeatherData]
    let main: Main
    let clouds: Clouds
    let sys: Sys
}

struct Coord: Codable {
    let lat, long: Double
}

struct WeatherData: Codable, Identifiable {
    let id: Int
    let main, description, icon: String
}

struct Main: Codable {
    let temp, tempMin, tempMax: Double
    let pressure, humadity: Int
}

struct Clouds: Codable {
    let all: String
}

struct Sys: Codable {
    let id, type, sunrise, sunset: Int
    let country: String
}
