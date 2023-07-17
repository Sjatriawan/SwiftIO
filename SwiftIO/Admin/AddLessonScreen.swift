//
//  AddLessonScreen.swift
//  SwiftIO
//
//  Created by M Yogi Satriawan on 14/07/23.
//

import SwiftUI

struct AddLessonScreen: View {
    var course: Course
    @StateObject private var viewModel = LessonViewModel()
    @State private var selectedLesson: Lesson?
    
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(viewModel.lessons, id: \.id) { lesson in
                            NavigationLink(destination: AddSubLessonScreen(lesson: lesson).navigationBarBackButtonHidden(), tag: lesson, selection: $selectedLesson) {
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
                
                Form {
                    Section(header: Text("Tambahkan Lesson")) {
                        HStack {
                            TextField("Judul", text: $viewModel.newTitle)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            Button(action: {
                                viewModel.addTitle(courseID: course.id)
                            }) {
                                Text("Tambah")
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(Color.blue) 
                                    .cornerRadius(5)
                            }
                        }
                    }
                }
                
                
                
            }
        }
        
    }
}

