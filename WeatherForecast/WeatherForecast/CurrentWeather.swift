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
    
    var tempConverted: Double {
        let tempInCelcius = ((weather?.main.temp1 ?? 0) - 32) * 5 / 9
        return tempInCelcius
    }
    
    var maxTempConverted: Double {
        let maxTempInCelcius = ((weather?.main.tempMax ?? 0) - 32) * 5 / 9
        return maxTempInCelcius
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
             Text("Today in \(weather?.name ?? "Unknown")")
                .font(.title)
                .foregroundColor(.white)
                .bold()
            
            HStack{
                Text("\(String(format: "%0.0f", tempConverted))ºC")
                    .foregroundColor(.white)
                    .fontWeight(Font.Weight.heavy)
                    .font(.system(size:30))//65
                Image("\(weather?.weather.last?.icon ?? "01d")")
                    .resizable()
                    .frame(width: 130, height: 130)
                    .aspectRatio(contentMode: .fit)
            }
            Text("\(weather?.weather.last?.description ?? "Unknown")")
                .foregroundColor(.white)
                .font(.body)
            Text("\(String(format: "%0.0f" ,maxTempConverted))ºc")
            .foregroundColor(.white)
            .font(.body)
        }.frame(width: height, height: height)
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

