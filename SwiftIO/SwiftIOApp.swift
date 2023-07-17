//
//  SwiftIOApp.swift
//  SwiftIO
//
//  Created by M Yogi Satriawan on 13/07/23.
//

import SwiftUI
import Firebase



@main
struct SwiftIOApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView(course: Course(id: "123", title: "Dummy Course"))
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      print("configured Firebase!")

    return true
  }
}
