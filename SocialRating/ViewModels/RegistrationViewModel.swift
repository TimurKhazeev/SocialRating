//
//  RegistrationViewModel.swift
//  SocialRating
//
//  Created by Тимур Хазеев on 11.11.2023.
//
// Логика страницы регистрации

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegistrationViewModel: ObservableObject {
  
  @Published var name = ""
  @Published var surname = ""
  @Published var patronymic = ""
  @Published var faculty = ""
  @Published var group = ""
  @Published var mail = ""
  @Published var phone = ""
  @Published var password = ""
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
    Auth.auth().createUser(withEmail: mail, password: password) {
      [weak self]  result, error in
      guard let userID = result?.user.uid else {
        return
      }
      
      self?.inertUserRecord(id: userID)
    }
  }
  
  private func inertUserRecord(id: String) {
    if selectedRole == .student {
      let newUser = User(id: id,
                            role: "student",
                            name: name,
                            surname: surname,
                            patronymic: patronymic,
                            faculty: faculty,
                            group: group,
                            mail: mail,
                            phone: phone,
                            points: 0)
      
      let db = Firestore.firestore()
      
      db.collection("users")
        .document(id)
        .setData(newUser.asDictionary())
      
    } else {
      let newUser = User(id: id,
                         role: "teacher",
                         name: name,
                         surname: surname,
                         patronymic: patronymic,
                         faculty: faculty,
                         group: "-",
                         mail: mail,
                         phone: phone,
                         points: 0)
      
      let db = Firestore.firestore()
      
      db.collection("users")
        .document(id)
        .setData(newUser.asDictionary())
    }
  }
  
  // Функция проверки на коректность ввода данных
  private func validate() -> Bool {
    errorMessage = ""
    
    if selectedRole == .student{
      guard !group.trimmingCharacters(in: .whitespaces).isEmpty else {
        errorMessage = "Пожалуйста заполните все поля"
        return false
      }
    } else {
      group = ""
    }
    
    guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
          !surname.trimmingCharacters(in: .whitespaces).isEmpty,
          !patronymic.trimmingCharacters(in: .whitespaces).isEmpty,
          !faculty.trimmingCharacters(in: .whitespaces).isEmpty,
          !mail.trimmingCharacters(in: .whitespaces).isEmpty,
          !phone.trimmingCharacters(in: .whitespaces).isEmpty,
          !password.trimmingCharacters(in: .whitespaces).isEmpty,
          !passwordRepeat.trimmingCharacters(in: .whitespaces).isEmpty else {
      errorMessage = "Пожалуйста заполните все поля"
      return false
    }
    
    guard mail.contains("@") && mail.contains(".") else {
      errorMessage = "Пожалуйста введите корректный Email"
      return false
    }
    
    guard password.count >= 8 else {
      errorMessage = "Пароль должен быть не короче 8 символов"
      return false
    }
    
    guard password == passwordRepeat else {
      errorMessage = "Пожалуйста введите идентичные пароли"
      return false
    }
    
    return true
  }
  
}
