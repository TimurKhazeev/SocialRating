//
//  PasswordRecoveryView.swift
//  SocialRating
//
//  Created by Тимур Хазеев on 13.11.2023.
//
// Страница востановления пароля

import SwiftUI

struct PasswordRecoveryView: View {
  
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    VStack {
      Spacer()
      
      // Motivating inscription
      Text("Вспоминайте")
        .font(.system(size: 30))
        .foregroundColor(.scarlet)
        .bold()
      
      Spacer()
      
      // Button to return to the last screen
      HStack {
        Text("Вспомнили пароль?")
          .foregroundColor(.gray)
        
        Button(action: {
          presentationMode.wrappedValue.dismiss()
        }) {
          Text("Войти")
            .foregroundColor(.scarlet)
        }
      }
      .padding(.bottom, 75)
    }
    
  }
}

#Preview {
  PasswordRecoveryView()
}
