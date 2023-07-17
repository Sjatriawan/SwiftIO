//
//  CourseScreen.swift
//  SwiftIO
//
//  Created by M Yogi Satriawan on 15/07/23.
//

import SwiftUI
import Firebase

struct CourseScreen: View {
    var course: Course
 
    @State private var selectedSubLesson: SubLesson?
    @StateObject private var viewModel = CourseViewModel()

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(viewModel.course, id: \.id) { course in
                    NavigationLink(destination: LessonScreen(course: course).navigationBarBackButtonHidden()) {
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



struct Course: Identifiable {
    let id: String
    let title: String
}

class CourseViewModel: ObservableObject {
    @Published var course: [Course] = []
    @Published var newTitle: String = ""

    private var db = Firestore.firestore()

    func loadData() {
        db.collection("course").addSnapshotListener { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("No documents found")
                return
            }

            self.course = documents.map { document in
                let data = document.data()
                let id = document.documentID
                let title = data["title"] as? String ?? ""
                return Course(id: id, title: title)
            }
        }
    }

    func addTitle() {
        let data: [String: Any] = ["title": newTitle]
        

        db.collection("course").addDocument(data: data) { error in
            if let error = error {
                print("Failed to add title: \(error)")
            } else {
                self.newTitle = ""
            }
        }
    }
}

//struct CourseScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        CourseScreen()
//    }
//}
