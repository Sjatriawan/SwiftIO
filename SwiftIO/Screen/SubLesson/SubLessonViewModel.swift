//
//  SubLessonViewModel.swift
//  SwiftIO
//
//  Created by M Yogi Satriawan on 14/07/23.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseFirestore
import SwiftUI


struct SubLesson: Identifiable, Hashable {
    let id: String
    let title: String
    let title_sublesson: String
    let intro: String
    let description: String
    let imageURL: String
    let imageURL_2: String
    let imageURLOutput: String
}

class SubLessonViewModel: ObservableObject {
    @Published var subLessons: [SubLesson] = []
    @Published var newSubLesson: String = ""
    @Published var title_sublesson: String = ""
    @Published var description: String = ""
    @Published var intro: String = ""
    @Published var selectedImage: UIImage?
    @Published var selectedImage_2: UIImage?
    @Published var selectedImageOutput: UIImage?
    @Published var isImagePickerPresented = false
    @Published var isImageOutputPickerPresented = false
    @Published var isImage2PickerPresented = false
    
    private var db = Firestore.firestore()
    private var subLessonsListener: ListenerRegistration?
    
    func loadSubLessons(lessonID: String) {
        subLessonsListener = db.collection("lessons").document(lessonID).collection("subLessons").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching sub lessons: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            self.subLessons = documents.compactMap { document in
                let data = document.data()
                let id = document.documentID
                let title = data["title"] as? String ?? ""
                let title_sublesson = data["title_sublesson"] as? String ?? ""
                let intro = data["intro"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let imageURL = data["imageURL"] as? String ?? ""
                let imageURL_2 = data["imageURL_2"] as? String ?? ""
                let imageURLOutput = data["imageURLOutput"] as? String ?? ""

                
                return SubLesson(id: id, title: title, title_sublesson: title_sublesson, intro: intro, description: description, imageURL: imageURL, imageURL_2: imageURL_2, imageURLOutput: imageURLOutput)
            }
        }
    }
    
    func addSubLesson(lessonID: String) {
        let subLessonData: [String: Any] = [
            "title": newSubLesson,
            "title_sublesson": title_sublesson,
            "intro": intro,
            "description": description,
            "imageURL": "",
            "imageURL_2": "",
            "imageURLOutput": ""
        ]
        
        let documentRef = db.collection("lessons").document(lessonID).collection("subLessons").document()
        
        documentRef.setData(subLessonData) { error in
            if let error = error {
                print("Failed to add sub lesson: \(error)")
            } else {
                self.uploadImage(self.selectedImage, to: documentRef)
                self.uploadImageOutput(self.selectedImageOutput, to: documentRef)
                self.uploadImage2(self.selectedImage_2, to: documentRef)
                self.newSubLesson = ""
                self.title_sublesson = ""
                self.description = ""
                self.intro = ""
            }
        }
    }
    
    private func uploadImage(_ image: UIImage?, to documentRef: DocumentReference) {
        guard let image = image,
              let imageData = image.jpegData(compressionQuality: 0.8) else {
            return
        }
        
        let storageRef = Storage.storage().reference()
        let imageRef = storageRef.child("subLessonImages/\(documentRef.documentID)/image.jpg")
        
        imageRef.putData(imageData, metadata: nil) { (_, error) in
            if let error = error {
                print("Failed to upload image: \(error)")
            } else {
                imageRef.downloadURL { (url, error) in
                    if let error = error {
                        print("Failed to get image URL: \(error)")
                    } else if let url = url {
                        documentRef.updateData(["imageURL": url.absoluteString])
                    }
                }
            }
        }
    }


    private func uploadImage2(_ image_2: UIImage?, to documentRef: DocumentReference) {
        guard let image_2 = image_2,
              let imageData = image_2.jpegData(compressionQuality: 0.8) else {
            return
        }
        
        let storageRef = Storage.storage().reference()
        let imageRef2 = storageRef.child("subLessonImages/\(documentRef.documentID)/image_2.jpg")
        
        imageRef2.putData(imageData, metadata: nil) { (_, error) in
            if let error = error {
                print("Failed to upload image: \(error)")
            } else {
                imageRef2.downloadURL { (url, error) in
                    if let error = error {
                        print("Failed to get image URL: \(error)")
                    } else if let url = url {
                        documentRef.updateData(["imageURL_2": url.absoluteString])
                    }
                }
            }
        }
    }



    private func uploadImageOutput(_ imageOutput: UIImage?, to documentRef: DocumentReference) {
        guard let imageOutput = imageOutput,
              let imageData = imageOutput.jpegData(compressionQuality: 0.8) else {
            return
        }
        
        let storageRef = Storage.storage().reference()
        let imageRef3 = storageRef.child("subLessonImages/\(documentRef.documentID)/image_output.jpg")
        
        imageRef3.putData(imageData, metadata: nil) { (_, error) in
            if let error = error {
                print("Failed to upload image: \(error)")
            } else {
                imageRef3.downloadURL { (url, error) in
                    if let error = error {
                        print("Failed to get image URL: \(error)")
                    } else if let url = url {
                        documentRef.updateData(["imageURLOutput": url.absoluteString])
                    }
                }
            }
        }
    }

    
    
    // Additional methods for updating or deleting sub lessons
    
    deinit {
        subLessonsListener?.remove()
    }
}
