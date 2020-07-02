//
//  Extension.swift
//  WeatherForecast
//
//  Created by Puneet Mahali on 02.07.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import SwiftUI

extension Double {
    var round: Int {
        return Int(self)
    }
}

extension Int {
    var timestamp: TimeInterval {
        return TimeInterval(self)
    }
    
    var toString: String {
        return String(self)
    }
}

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        guard var component = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            fatalError()
        }
        component.queryItems = queries.map { URLQueryItem(name: $0.key, value: $0.value)}
        return component.url
    }
}

extension DateFormatter {
    convenience init(dateFormat: String){
        self.init()
        self.dateFormat = dateFormat
    }
}

extension Date {
    static func dateFromUnixTimestamp(_ timestamp: TimeInterval) -> Date {
        return Date(timeIntervalSince1970: timestamp)
    }

    var day: String {
        let dateFormatter = DateFormatter(dateFormat: "EEEE")
        return dateFormatter.string(from: self)
    }
}

func dayOfTheWeekFromTimestamp(_ timestamp: TimeInterval) -> String {
    let date = Date.dateFromUnixTimestamp(timestamp)
    return date.day
}
