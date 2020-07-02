//
//  CardView.swift
//  WeatherForecast
//
//  Created by Puneet Mahali on 02.07.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var list: ListData?

    var body: some View {
        VStack{
            Text(dayOfTheWeekFromTimestamp(list?.dt?.timestamp ?? 0))
                .font(.title)
                .foregroundColor(.white)
            HStack{
               // Text("\(list.temp.day.rounded())º")
                Text("\(list?.temp.day ?? 0)")
                    //Text("\(weather?.main.temp?.rounded() ?? 0)")
                
                // weahter icon soon!!
                
                
               // Text("\(list?.temp.min.rounded())")
                Text("\(list?.temp.min?.rounded() ?? 0)")
                
                
                    .font(.title)
                    .foregroundColor(.white)
            }
            Text(list?.weather.last?.description ?? "Unkown")
                .font(.body)
                .foregroundColor(.white)
        }
    }
}

struct CardViewModifier: ViewModifier {
    var timestamp: TimeInterval

    init(_ timestamp: TimeInterval) {
        self.timestamp = timestamp
    }

    func body(content: Content) -> some View {
        content
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            
    }

    private var day: String {
        return dayOfTheWeekFromTimestamp(self.timestamp)
    }
}
