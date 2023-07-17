//
//  SubLessonScreen.swift
//  SwiftIO
//
//  Created by M Yogi Satriawan on 14/07/23.
//

import SwiftUI
import Firebase

struct SubLessonScreen: View {
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
            
        }
        .onAppear {
            viewModel.loadSubLessons(lessonID: lesson.id)
        }
    }
}


struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    
    private let controller = UIImagePickerController()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.image = info[.originalImage] as? UIImage
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}


struct CardView: View {
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .foregroundColor(.white)
                .padding()
        }
        .frame(width: 200, height: 100)
        .background(Color.blue)
        .cornerRadius(10)
    }
}

struct NextScreen: View {
    @State private var isExpanded = false
    var subLesson: SubLesson
    var body: some View {
        ZStack {
                ScrollView{
                    VStack(alignment: .leading){
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
                                    .scaledToFit()
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                            @unknown default:
                                EmptyView()
                            }
                        }
                        
                    }
                    Text(subLesson.description)
                            .foregroundColor(.black)
                            .font(.system(
                                size: 16,
                                weight: .thin,
                                design: .monospaced
                            )).frame(height: 40)
                        
                        Button(action: {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        }) {
                            Text("run")
                                .foregroundColor(.blue)
                                .font(.system(
                                    size: 12,
                                    weight: .ultraLight,
                                    design: .monospaced
                                ))
                        }
                        
                        if isExpanded {
                            if let imageURLOutput = URL(string: subLesson.imageURLOutput),
                               let imageDataOutput = try? Data(contentsOf: imageURLOutput),
                               let imageOutput = UIImage(data: imageDataOutput) {
                                
                                
                                AsyncImage(url: URL(string: subLesson.imageURLOutput)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let imageOutput):
                                        imageOutput
                                            .resizable()
                                            .scaledToFit()
                                    case .failure:
                                        Image(systemName: "photo")
                                            .resizable()
                                            .scaledToFit()
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                
                            }
                        }

                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading).padding()
                
                
            }
        }
    }
}



//struct NextScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        let dummySubLesson = SubLesson(id: "123", title: "SubLesson", title_sublesson: "asas", intro: "Dummy Intro", description: "Dummy Description", imageURL: "https://dummyimage.com/200x200")
//        NextScreen(subLesson: dummySubLesson)
//    }
//}
