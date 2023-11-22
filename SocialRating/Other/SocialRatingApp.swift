//
//  SocialRatingApp.swift
//  SocialRating
//
//  Created by Тимур Хазеев on 11.11.2023.
//

import SwiftUI
import FirebaseCore

@main
struct SocialRatingApp: App {
  
  init() {
    FirebaseApp.configure()
  }
  
    var body: some Scene {
        WindowGroup {
          ScreensaverView()
        }
    }
}
