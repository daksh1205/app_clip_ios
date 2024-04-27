//
//  MyAppClipApp.swift
//  MyAppClip
//
//  Created by Daksh  on 23/04/24.
//

import SwiftUI
import Firebase


@main
struct MyAppClipApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            IntroductionView()
        }
    }
}
