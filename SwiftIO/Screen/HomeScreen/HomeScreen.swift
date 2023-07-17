//
//  HomeScreen.swift
//  SwiftIO
//
//  Created by M Yogi Satriawan on 15/07/23.
//

import SwiftUI

struct HomeScreen: View {
    var course: Course
 
    @State private var selectedSubLesson: SubLesson?
    @StateObject private var viewModel = CourseViewModel()
    @State private var isShowingPinScreen = false
    @State private var isPinCorrect = false

    var body: some View {
        NavigationView{
            ZStack{
                BackgroundColorGreen()
                VStack(alignment: .leading){
                    HStack{
                        Text("Home")
                            .foregroundColor(.white)
                            .font(.system(
                                size: 50,
                                weight: .bold,
                                design: .monospaced
                            )).frame(height: 30)
                        Spacer()
                        NavigationLink(destination: AddCourseScreen(course: course), isActive: $isPinCorrect) {
                                            EmptyView()
                                        }
                                        .hidden()

                                        Button("Next Screen") {
                                            isShowingPinScreen = true
                                        }
                                        .padding()
                                        .sheet(isPresented: $isShowingPinScreen) {
                                            PinScreen(isPinCorrect: $isPinCorrect)
                                        }

                    }
                    
                    Text("Learn how to build an app")
                        .foregroundColor(.white)
                        .font(.system(
                            size: 20,
                            weight: .semibold,
                            design: .monospaced
                        ))
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            ForEach(viewModel.course, id: \.id) { course in
                                NavigationLink(destination: LessonScreen(course: course)) {
                                                               LessonCardSwift(text: course.title)
                                                           }
                            }
                        }
                            .onAppear {
                                viewModel.loadData()
                            }
                     
                    }
                    Text("Build iOS App")
                        .foregroundColor(.white)
                        .font(.system(
                            size: 22,
                            weight: .bold,
                            design: .monospaced
                        ))
                        .frame(height: 30)
                    Text("using Kotlin Multiplatform")
                        .foregroundColor(.white)
                        .font(.system(
                            size: 16,
                            weight: .semibold,
                            design: .monospaced
                        ))
                    
                    LessonCardPurple()
                    Spacer()
                }.padding()
                  
                
            }
        }
    }
}

struct PinScreen: View {
    @Binding var isPinCorrect: Bool
    @State private var pin = ""

    var body: some View {
        VStack {
            Text("Enter PIN")
                .font(.title)

            TextField("PIN", text: $pin)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Submit") {
                // Perform pin verification logic here
                isPinCorrect = pin == "12"

            }
            .padding()
        }
    }

    private func dismiss() {
        DispatchQueue.main.async {
            isPinCorrect = false
        }
    }
}



struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        let dummyCourse = Course(id: "123", title: "Dummy Course")
        HomeScreen(course: dummyCourse)
    }
}
