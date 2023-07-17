//
//  AddSubLessonScreen.swift
//  SwiftIO
//
//  Created by M Yogi Satriawan on 14/07/23.
//

import SwiftUI

import SwiftUI
import Firebase

struct AddSubLessonScreen: View {
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
            
            HStack {

                TextField("Tambah Sub Lesson", text: $viewModel.newSubLesson)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    viewModel.addSubLesson(lessonID: lesson.id)
                }) {
                    Text("Tambah")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color.blue)
                        .cornerRadius(5)
                }
            }
            .padding()
            
            Form {
                Section(header: Text("Intro")) {
                    TextField("Masukkan intro", text: $viewModel.intro)
                }
                Section(header: Text("Subtitle")) {
                    TextField("Masukkan subtitle", text: $viewModel.title_sublesson)
                }
                Section(header: Text("Gambar")) {
                    if let image = viewModel.selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                    }
                    
                    Button(action: {
                        viewModel.isImagePickerPresented = true
                    }) {
                        Text("Pilih Gambar")
                    }
                    .sheet(isPresented: $viewModel.isImagePickerPresented) {
                        ImagePicker(image: $viewModel.selectedImage)
                            .onDisappear {
                                viewModel.isImagePickerPresented = false
                            }
                    }
                }
                
                Section(header: Text("Deskripsi")) {
                    TextField("Masukkan deskripsi", text: $viewModel.description)
                }
               
                Section(header: Text("Gambar 2")) {
                    if let image_2 = viewModel.selectedImage_2 {
                        Image(uiImage: image_2)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                    }
                    
                    Button(action: {
                        viewModel.isImage2PickerPresented = true
                    }) {
                        Text("Pilih Gambar 2")
                    }
                    .sheet(isPresented: $viewModel.isImage2PickerPresented) {
                        ImagePicker(image: $viewModel.selectedImage_2)
                    }
                }
                
                Section(header: Text("Gambar")) {
                    if let imageOutput = viewModel.selectedImageOutput {
                        Image(uiImage: imageOutput)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                    }
                    
                    Button(action: {
                        viewModel.isImageOutputPickerPresented = true
                    }) {
                        Text("Pilih Gambar Output")
                    }
                    .sheet(isPresented: $viewModel.isImageOutputPickerPresented) {
                        ImagePicker(image: $viewModel.selectedImageOutput)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Sub Lesson")
        .onAppear {
            viewModel.loadSubLessons(lessonID: lesson.id)
        }
    }
}



struct NextScreenAdmin: View {
    var subLesson: SubLesson
       
       var body: some View {
           ZStack {
               VStack(alignment: .leading){
                   ScrollView{
                       Text(subLesson.title)
                           .foregroundColor(.black)
                           .font(.system(
                               size: 30,
                               weight: .bold,
                               design: .monospaced
                           )).frame(height: 45)
                       
                       Text(subLesson.intro)
                           .foregroundColor(.black)
                           .font(.system(
                               size: 16,
                               weight: .semibold,
                               design: .monospaced
                           )).frame(height: 45)
                       if let imageURL = URL(string: subLesson.imageURL),
                          let imageData = try? Data(contentsOf: imageURL),
                          let image = UIImage(data: imageData) {
                           
                    
                           AsyncImage(url: URL(string: subLesson.imageURL)) { phase in
                               switch phase {
                               case .empty:
                                   ProgressView()
                               case .success(let image):
                                   image
                                       .resizable()
                                       .aspectRatio(contentMode: .fit)
                                       .frame(height: 200)
                               case .failure:
                                   Image(systemName: "photo")
                                       .resizable()
                                       .aspectRatio(contentMode: .fit)
                                       .frame(height: 200)
                               @unknown default:
                                   EmptyView()
                               }
                           }

                       }
                       
                       Text(subLesson.description)
                           .padding()
                   }
                   
           
               }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading).padding()
           }
       }
}
