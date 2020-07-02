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
    let lon, lat: Double?
}

struct WeatherData: Codable, Identifiable {
    let id: Int
    let main, description, icon: String?
}

struct Main: Codable {
    let temp1, tempMin, tempMax: Double?
    let pressure, humidity: Int?
}

struct Clouds: Codable {
    let all: Int?
}

struct Sys: Codable {
    let id, type, sunrise, sunset: Int?
    let country: String?
}
