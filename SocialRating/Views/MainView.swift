//
//  ContentView.swift
//  SocialRating
//
//  Created by Тимур Хазеев on 11.11.2023.
//

import SwiftUI

struct MainView: View {
  
  @StateObject var viewModel = MainViewModel()
  
    var body: some View {
    
      if viewModel.isSignedId, !viewModel.currentUserId.isEmpty {
        if viewModel.userRole == "teacher" {
          MasterTeacherView()
        } else {
          MasterStudentView()
        }
      } else {
        InputView()
      }
        
    }
}

#Preview {
  MainView()
}
