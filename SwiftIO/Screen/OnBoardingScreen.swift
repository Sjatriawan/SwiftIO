//
//  OnBoardingScreen.swift
//  SwiftIO
//
//  Created by M Yogi Satriawan on 15/07/23.
//

import SwiftUI

struct OnBoardingScreen: View {
    var course: Course
 
    var body: some View {
        NavigationView{
            ZStack{
                BackgroundColor()
                BackgroundIntro(course: course)
                
            }
        }
    }
}



struct BackgroundIntro: View{
    var course: Course
 
    @State private var selectedSubLesson: SubLesson?
    @StateObject private var viewModel = CourseViewModel()
    
    
    @State private var descIntro:String = "Learn how to Build iOS app with easy way"
    @State private var intro: String = "Swift Cool"
    var body: some View{
        VStack(alignment: .leading){
            Spacer()
            Text(intro)
                .foregroundColor(.white)
                .font(.system(
                    size: 100,
                    design: .monospaced
                ))
            Text(descIntro)
                .foregroundColor(.white)
                .font(.system(
                    size: 20,
                    design: .monospaced
                ))
            Spacer()
            HStack{
                Spacer()
                NavigationLink(destination: HomeScreen(course: course).navigationBarBackButtonHidden()) {
                    Text("Next")
                        .frame(width: 200, height: 44)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 22)
                                .stroke(.white, lineWidth: 3)
                        )
                }
                
            }
            
            
        }.padding()
    }
}

struct BackgroundColor: View{
    var body: some View{
        ZStack{
            Color("background")
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
                .foregroundColor(Color("rectColor"))
                .position(x: 350)
            Rectangle()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
                .foregroundColor(Color("rectColor"))
                .position(y: 200)
            
            Rectangle()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
                .foregroundColor(Color("rectColor"))
                .position(x: 350, y: 500)
            Rectangle()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
                .foregroundColor(Color("rectColor"))
                .position(x: 200, y: 660)
            
        }
    }
}

struct BackgroundColorGreen: View{
    var body: some View{
        ZStack{
            Color("backgroundYellow")
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
                .foregroundColor(Color("rectColorYellow"))
                .position(x: 350)
            Rectangle()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
                .foregroundColor(Color("rectColorYellow"))
                .position(y: 200)
            
            Rectangle()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
                .foregroundColor(Color("rectColorYellow"))
                .position(x: 350, y: 500)
            Rectangle()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
                .foregroundColor(Color("rectColorYellow"))
                .position(x: 200, y: 660)
            
        }
    }
}

struct BackgroundColorGray: View{
    var body: some View{
        ZStack{
            Color("backgroundGray")
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
                .foregroundColor(Color("rectColorGray"))
                .position(x: 350)
            Rectangle()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
                .foregroundColor(Color("rectColorGray"))
                .position(y: 200)
            
            Rectangle()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
                .foregroundColor(Color("rectColorGray"))
                .position(x: 350, y: 500)
            Rectangle()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
                .foregroundColor(Color("rectColorGray"))
                .position(x: 200, y: 660)
            
        }
    }
}


