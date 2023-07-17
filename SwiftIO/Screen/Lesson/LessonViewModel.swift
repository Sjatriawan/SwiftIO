//
//  LessonViewModel.swift
//  SwiftIO
//
//  Created by M Yogi Satriawan on 14/07/23.
//

import SwiftUI
import Firebase


struct Lesson: Identifiable, Hashable {
    let id: String
    let title: String
}

class LessonViewModel: ObservableObject {
    @Published var lessons: [Lesson] = []
    @Published var newTitle: String = ""

    private var db = Firestore.firestore()
    private var subLessonsListener: ListenerRegistration?


    func loadData(courseID: String) {
        db.collection("courses").document(courseID).collection("lessons").addSnapshotListener { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("No documents found")
                return
            }

            self.lessons = documents.map { document in
                let data = document.data()
                let id = document.documentID
                let title = data["title"] as? String ?? ""
                return Lesson(id: id, title: title)
            }
        }
    }

    
    func addTitle(courseID: String) {
        let data: [String: Any] = [
            "title": newTitle,
            // Tambahkan properti lain yang diperlukan untuk lesson
        ]

        db.collection("courses").document(courseID).collection("lessons").addDocument(data: data) { error in
            if let error = error {
                print("Failed to add lesson: \(error)")
            } else {
                self.newTitle = ""
            }
        }
    }


//    func addTitle() {
//        let data: [String: Any] = ["title": newTitle]
//
//
//
//        db.collection("lessons").addDocument(data: data) { error in
//            if let error = error {
//                print("Failed to add title: \(error)")
//            } else {
//                self.newTitle = ""
//            }
//        }
//    }
}


//class LessonViewModel: ObservableObject {
//    @Published var titles: [String] = []
//    @Published var newTitle: String = ""
//
//    private var db = Firestore.firestore()
//
//    func loadData() {
//        db.collection("lessons").getDocuments { (snapshot, error) in
//            if let error = error {
//                print("Failed to load data: \(error)")
//                return
//            }
//
//            guard let documents = snapshot?.documents else {
//                print("No documents found")
//                return
//            }
//
//            self.titles = documents.map { $0["title"] as? String ?? "" }
//        }
//    }
//
//    func addTitle() {
//        let data: [String: Any] = ["title": newTitle]
//
//        db.collection("lessons").addDocument(data: data) { error in
//            if let error = error {
//                print("Failed to add title: \(error)")
//            } else {
//                self.newTitle = ""
//            }
//        }
//    }
//}
