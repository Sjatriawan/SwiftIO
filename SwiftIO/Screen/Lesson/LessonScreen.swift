//
//  LessonScreen.swift
//  SwiftIO
//
//  Created by M Yogi Satriawan on 13/07/23.
//

import SwiftUI
import Firebase

struct LessonScreen: View {
    var course: Course
    @StateObject private var viewModel = LessonViewModel()
    @State private var selectedLesson: Lesson?
    

    var body: some View {
        NavigationView {
            ZStack{
                VStack(alignment: .leading){
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            ForEach(viewModel.lessons, id: \.id) { lesson in
                                NavigationLink(destination: SubjectScreen(lesson: lesson).navigationBarBackButtonHidden(), tag: lesson, selection: $selectedLesson) {
                                    VStack {
                                        LessonCardSwift(text: lesson.title)
                                            .onTapGesture {
                                                selectedLesson = lesson
                                            }
                                            .padding()
                                        
                                        
                                    }
                                }
                            }
                        }
                        
                    }
                    .onAppear {
                        viewModel.loadData(courseID: course.id)
                    }
                }
            }
        }
    }
}



