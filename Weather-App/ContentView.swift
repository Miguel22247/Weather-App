//
//  ContentView.swift
//  Weather-App
//
//  Created by Miguel Pacheco on 12/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false

    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Montevideo, UY")
                WeatherStatusView(imageName: isNight ? "moon.stars.fill" : "sun.max.fill", temperature: 28)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 38)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 42)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sun.bolt.fill", temperature: 32)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.rain.fill", temperature: 30)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.hail.fill", temperature: 28)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    var cityName: String

    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
    }
}

struct WeatherStatusView: View {
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
