//
//  RegistrationViewModel.swift
//  SocialRating
//
//  Created by Тимур Хазеев on 11.11.2023.
//
// Логика страницы регистрации

import Foundation

class RegistrationViewModel: ObservableObject {
  
  struct RegistrationData: Codable {
    var name = ""
    var surname = ""
    var patronymic = ""
    var faculty = ""
    var group = ""
    var mail = ""
    var phone = ""
    var password = ""
  }
  
  @Published var registrationData = RegistrationData()
  @Published var passwordRepeat = ""
  @Published public var selectedRole: Role = .student
  @Published var errorMessage = ""
  
  enum Role {
    case student
    case teacher
  }
  
  init() {}
  
  func registration() {
    guard validate() else {
      return
    }
    
    // Отправка запроса на апи для регистрации
  }
  
  private func validate() -> Bool {
    errorMessage = ""
    
    if selectedRole == .student{
      guard !registrationData.group.trimmingCharacters(in: .whitespaces).isEmpty else {
        errorMessage = "Пожалуйста заполните все поля"
        return false
      }
    } else {
      registrationData.group = ""
    }
    
    guard !registrationData.name.trimmingCharacters(in: .whitespaces).isEmpty,
          !registrationData.surname.trimmingCharacters(in: .whitespaces).isEmpty,
          !registrationData.patronymic.trimmingCharacters(in: .whitespaces).isEmpty,
          !registrationData.faculty.trimmingCharacters(in: .whitespaces).isEmpty,
          !registrationData.mail.trimmingCharacters(in: .whitespaces).isEmpty,
          !registrationData.phone.trimmingCharacters(in: .whitespaces).isEmpty,
          !registrationData.password.trimmingCharacters(in: .whitespaces).isEmpty,
          !passwordRepeat.trimmingCharacters(in: .whitespaces).isEmpty else {
      errorMessage = "Пожалуйста заполните все поля"
      return false
    }
    
    guard registrationData.mail.contains("@") && registrationData.mail.contains(".") else {
      errorMessage = "Пожалуйста введите корректный Email"
      return false
    }
    
    guard registrationData.password.count >= 8 else {
      errorMessage = "Пароль должен быть не короче 8 символов"
      return false
    }
    
    guard registrationData.password == passwordRepeat else {
      errorMessage = "Пожалуйста введите идентичные пароли"
      return false
    }
    
    return true
  }
  
}
