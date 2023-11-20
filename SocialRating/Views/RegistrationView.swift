//
//  RegistrationView.swift
//  SocialRating
//
//  Created by Тимур Хазеев on 11.11.2023.
//
// Страница регистрации

import SwiftUI

struct RegistrationView: View {
  
  @Environment(\.presentationMode) var presentationMode
  @StateObject var viewModel = RegistrationViewModel()
  
  var body: some View {
    
    // Error Message
    VStack {
      if !viewModel.errorMessage.isEmpty {
        Text(viewModel.errorMessage)
          .foregroundColor(.blue)
      }
    }
    .padding(.top, 15)
    
    
    ScrollView{
      // Heder
      HStack {
        Image("logoScarlet")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 75, height: 75)
        
        Text("Унирейт")
          .font(.system(size: 40))
          .foregroundColor(.scarlet)
          .bold()
      }
      .padding(.top, 15)
      
      // Registration block
      VStack{
        
        // Title enter
        HStack{
          Text("Регистрация")
            .font(.system(size: 30))
            .foregroundColor(.scarlet)
            .bold()
          Spacer()
        }
        .padding(.top, 25)
        
        // Student and teacher selection buttons
        HStack {
          Button(action: {
            viewModel.selectedRole = .student
          }) {
//            Image(systemName: "record.circle")
//              .foregroundColor(viewModel.selectedRole == .student ?                                  Color.scarlet : Color.gray)
            
            Text("Студент")
              .foregroundColor(viewModel.selectedRole == .student ? Color.myBlackWhite : Color.gray)
          }
          .padding()
          
          Button(action: {
            viewModel.selectedRole = .teacher
          }) {
//            Image(systemName: "record.circle")
//              .foregroundColor(viewModel.selectedRole == .teacher ?                                  Color.scarlet : Color.gray)
            
            Text("Преподаватель")
              .foregroundColor(viewModel.selectedRole == .teacher ? Color.myBlackWhite : Color.gray)
          }
          .padding()
        }
        
        // Slot name
        HStack{
          Text("Имя")
          Spacer()
        }
        .padding(.top, 10)
        
        
        TextField("Введите имя", text: $viewModel.registrationData.name)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .autocorrectionDisabled(true)
          
        // Slot surname
        HStack{
          Text("Фамилия")
          Spacer()
        }
        .padding(.top, 15)
        
        TextField("Введите фамилию", text: $viewModel.registrationData.surname)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .autocorrectionDisabled(true)
        
        // Slot patronymic
        HStack{
          Text("Отчество")
          Spacer()
        }
        .padding(.top, 15)
        
        TextField("Введите отчество", text: $viewModel.registrationData.patronymic)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .autocorrectionDisabled(true)
        
        // Slot faculty
        HStack{
          Text("Факультет")
          Spacer()
        }
        .padding(.top, 15)
        
        TextField("Введите факультет", text: $viewModel.registrationData.faculty)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .autocorrectionDisabled(true)
        
        // Slot group
        if viewModel.selectedRole == .student {
          HStack{
            Text("Группа")
            Spacer()
          }
          .padding(.top, 15)
          
          TextField("Введите группу", text: $viewModel.registrationData.group)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocorrectionDisabled(true)
        }
        
        // Slot mail
        HStack{
          Text("Email")
          Spacer()
        }
        .padding(.top, 15)
        
        TextField("Введите Email", text: $viewModel.registrationData.mail)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .autocorrectionDisabled(true)
        
        // Slot phone
        HStack{
          Text("Телефон")
          Spacer()
        }
        .padding(.top, 15)
        
        TextField("Введите телефон", text: $viewModel.registrationData.phone)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .autocorrectionDisabled(true)
        
        // Slot password
        HStack{
          Text("Пароль")
          Spacer()
        }
        .padding(.top, 15)
        
        SecureField("Введите пароль", text: $viewModel.registrationData.password)
          .textFieldStyle(RoundedBorderTextFieldStyle())
        
        // Slot repeat password
        HStack{
          Text("Повтор пароля")
          Spacer()
        }
        .padding(.top, 15)
        
        SecureField("Введите пароль", text: $viewModel.passwordRepeat)
          .textFieldStyle(RoundedBorderTextFieldStyle())
        
        // Registration button
        Button(action: {
          viewModel.registration()
        }) {
          Text("Регистрация")
            .font(.system(size: 30))
            .foregroundColor(.white)
            .bold()
        }
        .buttonStyle(SRButton())
        .padding(.top, 25)
        .padding(.bottom, 50)
        
      }
    }
    .padding(.horizontal, 10)
    
    // Button to return to the last screen
    HStack {
      Text("Уже есть аккаунт?")
        .foregroundColor(.gray)
      
      Button(action: {
        presentationMode.wrappedValue.dismiss()
      }) {
        Text("Войти")
          .foregroundColor(.scarlet)
      }
    }
    
    
  }
}

#Preview {
  RegistrationView()
}
