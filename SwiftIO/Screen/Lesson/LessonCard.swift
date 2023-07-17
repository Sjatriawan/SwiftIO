//
//  LessonCard.swift
//  SwiftIO
//
//  Created by M Yogi Satriawan on 14/07/23.
//

import SwiftUI


struct LessonCardSwift: View {
    var text: String
    var body: some View {
        ZStack{
            Rectangle()
                .cornerRadius(30)
                .foregroundColor(Color("backgroundOrange"))
                .frame(width: 350, height: 200)
            Rectangle()
                .cornerRadius(80)
                .foregroundColor(Color("rectColorOrange"))
                .frame(width: 80, height: 80)
                .position(x: 180, y: 10)
            Rectangle()
                .cornerRadius(12)
                .foregroundColor(Color("rectColorOrange"))
                .frame(width: 80, height: 100)
                .position(x: 350, y: 100)
            Rectangle()
                .cornerRadius(12)
                .foregroundColor(Color("rectColorOrange"))
                .frame(width: 80, height: 80)
                .position(x: 10, y: 180)
            VStack{
                Text(text)
                    .foregroundColor(.white)
                    .font(.system(
                    size: 26,
                    weight: .bold,
                    design: .monospaced))
                    .lineLimit(3)
                    .padding()
            }.frame(width: 350, height: 200)
            .cornerRadius(30)
        }.frame(width: 350, height: 200)
        .cornerRadius(30)
    }
}


struct LessonCardRed: View {
    var body: some View {
        ZStack{
            Rectangle()
                .cornerRadius(30)
                .foregroundColor(Color("background"))
                .frame(width: 150, height: 200)
            Rectangle()
                .cornerRadius(30)
                .foregroundColor(Color("rectColor"))
                .frame(width: 50, height: 50)
                .position(x: 20, y: 20)
            Rectangle()
                .cornerRadius(12)
                .foregroundColor(Color("rectColor"))
                .frame(width: 50, height: 50)
                .position(x: 100, y: 80)
            Rectangle()
                .cornerRadius(12)
                .foregroundColor(Color("rectColor"))
                .frame(width: 50, height: 50)
                .position(x: 10, y: 180)
            VStack{
                Text("Swift")
                    .foregroundColor(.white)
                    .font(.system(
                    size: 41,
                    weight: .bold,
                    design: .monospaced))

            }.frame(width: 150, height: 200)
                .cornerRadius(30)
           
               
        }.frame(width: 150, height: 200)
            .cornerRadius(30)
    }
}
struct LessonCardGreen: View {
    var body: some View {
        ZStack{
            Rectangle()
                .cornerRadius(30)
                .foregroundColor(Color("backgroundGreen"))
                .frame(width: 150, height: 200)
            Rectangle()
                .cornerRadius(30)
                .foregroundColor(Color("rectColorGreen"))
                .frame(width: 50, height: 50)
                .position(x: 20, y: 20)
            Rectangle()
                .cornerRadius(12)
                .foregroundColor(Color("rectColorGreen"))
                .frame(width: 50, height: 50)
                .position(x: 100, y: 80)
            Rectangle()
                .cornerRadius(12)
                .foregroundColor(Color("rectColorGreen"))
                .frame(width: 50, height: 50)
                .position(x: 10, y: 180)
            VStack{
                Text("SwiftUI")
                    .foregroundColor(.white)
                    .font(.system(
                    size: 41,
                    weight: .bold,
                    design: .monospaced))

            }.frame(width: 150, height: 200)
                .cornerRadius(30)
           
               
        }.frame(width: 150, height: 200)
            .cornerRadius(30)
    }
}
struct LessonCardBlue: View {
    var body: some View {
        ZStack{
            Rectangle()
                .cornerRadius(30)
                .foregroundColor(Color("backgroundBlue"))
                .frame(width: 150, height: 200)
            Rectangle()
                .cornerRadius(30)
                .foregroundColor(Color("rectColorBlue"))
                .frame(width: 50, height: 50)
                .position(x: 20, y: 20)
            Rectangle()
                .cornerRadius(12)
                .foregroundColor(Color("rectColorBlue"))
                .frame(width: 50, height: 50)
                .position(x: 100, y: 80)
            Rectangle()
                .cornerRadius(12)
                .foregroundColor(Color("rectColorBlue"))
                .frame(width: 50, height: 50)
                .position(x: 10, y: 180)
            VStack{
                Text("UIKit")
                    .foregroundColor(.white)
                    .font(.system(
                    size: 41,
                    weight: .bold,
                    design: .monospaced))
                    .lineLimit(2)

            }.frame(width: 150, height: 200)
                .cornerRadius(30)
           
               
        }.frame(width: 150, height: 200)
            .cornerRadius(30)
    }
}

struct LessonCardPurple: View {
    var body: some View {
        ZStack{
            Rectangle()
                .cornerRadius(30)
                .foregroundColor(Color("backgroundPurple"))
                .frame(width: 250, height: 200)
            Rectangle()
                .cornerRadius(30)
                .foregroundColor(Color("rectColorPurple"))
                .frame(width: 50, height: 50)
                .position(x: 20, y: 20)
            Rectangle()
                .cornerRadius(12)
                .foregroundColor(Color("rectColorPurple"))
                .frame(width: 50, height: 50)
                .position(x: 230, y: 80)
            Rectangle()
                .cornerRadius(12)
                .foregroundColor(Color("rectColorPurple"))
                .frame(width: 50, height: 50)
                .position(x: 10, y: 180)
            VStack{
                Text("Kotlin Multiplatform Mobile")
                    .foregroundColor(.white)
                    .font(.system(
                    size: 26,
                    weight: .bold,
                    design: .monospaced))
                    .lineLimit(3)
                    .padding()

            }.frame(width: 250, height: 200)
                .cornerRadius(30)
           
               
        }.frame(width: 250, height: 200)
            .cornerRadius(30)
    }
}
