//
//  DetailsAppClipApp.swift
//  DetailsAppClip
//
//  Created by Daksh  on 27/04/24.
//

import SwiftUI
import Firebase

@main
struct DetailsAppClipApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            IntroductionView()
        }
    }
}
