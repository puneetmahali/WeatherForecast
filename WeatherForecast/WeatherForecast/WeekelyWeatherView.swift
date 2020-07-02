//
//  WeekelyWeatherView.swift
//  WeatherForecast
//
//  Created by Puneet Mahali on 02.07.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import SwiftUI

struct WeeklyWeatherView: View {
    var listData: [ListData] = []
    var value: Int = 0
    var height: CGFloat = 0
    var width = UIScreen.main.bounds.width / 2

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(listData) { list in
                    CardView(list: list)
                    .frame(width: self.width, height: self.value == 0 ? 0 : self.height * 0.60)
                    .animation(.easeInOut(duration: 0.5))
                        .modifier(CardViewModifier(list.dt?.timestamp ?? 0))
                }
            }
        }.padding(20)
        .frame(height: self.value == 0 ? 0 : self.height * 0.65).animation(.easeInOut(duration: 0.5))
    }
}
