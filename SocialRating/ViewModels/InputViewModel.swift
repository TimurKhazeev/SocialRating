//
//  InputViewModel.swift
//  SocialRating
//
//  Created by Тимур Хазеев on 11.11.2023.
//
// Логика страницы входа

import Foundation
import SwiftUI

class InputViewModel: ObservableObject {
  
  class LoginDate: Codable{
    var mail = ""
    var password = ""
  }
  
  @Published var loginDate = LoginDate()
  @Published var errorMessage = ""
  
  init() {}
  
  func login() {
    guard validate() else {
      return
    }
    
    // Отправка запроса на апи для входа
  }
  
  private func validate() -> Bool {
    errorMessage = ""
    guard !loginDate.mail.trimmingCharacters(in: .whitespaces).isEmpty,
          !loginDate.password.trimmingCharacters(in: .whitespaces).isEmpty else {
      errorMessage = "Пожалуйста заполните все поля."
      return false
    }
    
    guard loginDate.mail.contains("@") && loginDate.mail.contains(".") else {
      errorMessage = "Пожалуйста введите корректный Email."
      return false
    }
    
    return true
  }
  
}
