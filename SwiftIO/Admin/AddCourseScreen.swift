//
//  AddCourseScreen.swift
//  SwiftIO
//
//  Created by M Yogi Satriawan on 15/07/23.
//

import SwiftUI

struct AddCourseScreen: View {
    var course: Course
 
    @State private var selectedSubLesson: SubLesson?
    @StateObject private var viewModel = CourseViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Tambahkan Course")) {
                        HStack {
                            TextField("Judul", text: $viewModel.newTitle)
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                            Button(action: {
                                viewModel.addTitle()
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
                
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(viewModel.course, id: \.id) { course in
                            NavigationLink(destination: AddLessonScreen(course: course).navigationBarBackButtonHidden()) {
                                                           LessonCardSwift(text: course.title)
                                                       }
                        }
                    }
                        .onAppear {
                            viewModel.loadData()
                        }
                 
                }
            }
       
        }
    }
}

struct AddCourseScreen_Previews: PreviewProvider {
    static var previews: some View {
        let dummyCourse = Course(id: "123", title: "Dummy Course")
        AddCourseScreen(course: dummyCourse)
    }
}
