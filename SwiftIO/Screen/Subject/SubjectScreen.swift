//
//  SubjectScreen.swift
//  SwiftIO
//
//  Created by M Yogi Satriawan on 14/07/23.
//

import SwiftUI
import Firebase

//struct SubLessonDetails {
//    let title: String
//    let subtitle:String
//    let intro: String
//    let description: String
//}

struct SubjectScreen: View {
    var lesson: Lesson
       @StateObject private var viewModel = SubLessonViewModel()
       @State private var selectedSubLesson: SubLesson?

    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.subLessons, id: \.id) { subLesson in
                        NavigationLink(destination: NextScreen(subLesson: subLesson).navigationBarBackButtonHidden(true), tag: subLesson, selection: $selectedSubLesson) {
                                                    VStack {
                                                        LessonCardSwift(text: subLesson.title)
                                                            .onTapGesture {
                                                                selectedSubLesson = subLesson
                                                            }
                                                            .padding()

                                                        
                                                    }
                                                }
                    }
                }
            }
        }.onAppear {
            viewModel.loadSubLessons(lessonID: lesson.id)
        }
    }
}
