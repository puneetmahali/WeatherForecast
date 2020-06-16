//
//  CurrentWeather.swift
//  WeatherForecast
//
//  Created by Puneet Mahali on 16.06.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import SwiftUI


struct CurrentWeather: View {
    var weather: Weather?
    var height: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Today")
                .font(.title)
                .foregroundColor(.white)
                .bold()
            HStack{
                Text("\(weather?.main.temp.rounded() ?? 0)")
                .foregroundColor(.white)
                .fontWeight(Font.Weight.heavy)
                .font(.system(size:65))
            }
            Text("\(weather?.weather.last?.description ?? "Unknown")")
                .foregroundColor(.white)
                .font(.body)
            Text("\(weather?.main.tempMax.rounded() ?? 0)")
            .foregroundColor(.white)
            .font(.body)
        }.frame(width: height, height: height)
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

