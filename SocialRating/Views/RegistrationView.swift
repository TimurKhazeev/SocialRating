//
//  RegistrationView.swift
//  SocialRating
//
//  Created by Тимур Хазеев on 11.11.2023.
//

import SwiftUI

struct RegistrationView: View {
  
  @Environment(\.presentationMode) var presentationMode
  @State var name = ""
  @State var surname = ""
  @State var patronymic = ""
  @State var faculty = ""
  @State var group = ""
  @State var mail = ""
  @State var phone = ""
  @State var password = ""
  @State var passwordRepeat = ""
  
  var body: some View {
    VStack {
      
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
      
      // Registration form
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
        
        // Student or teacher
        
        
        ScrollView{
          
          // Slot name
          HStack{
            Text("Имя")
            Spacer()
          }
          .padding(.top, 5)
          
          TextField("Введите имя", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
          
          // Slot surname
          HStack{
            Text("Фамилия")
            Spacer()
          }
          .padding(.top, 5)
          
          TextField("Введите фамилию", text: $surname)
            .textFieldStyle(RoundedBorderTextFieldStyle())
          
          // Slot patronymic
          HStack{
            Text("Отчество")
            Spacer()
          }
          .padding(.top, 5)
          
          TextField("Введите отчество", text: $patronymic)
            .textFieldStyle(RoundedBorderTextFieldStyle())
          
          // Slot faculty
          HStack{
            Text("Факультет")
            Spacer()
          }
          .padding(.top, 5)
          
          TextField("Введите факультет", text: $faculty)
            .textFieldStyle(RoundedBorderTextFieldStyle())
          
          // Slot group
          HStack{
            Text("Группа")
            Spacer()
          }
          .padding(.top, 5)
          
          TextField("Введите группу", text: $group)
            .textFieldStyle(RoundedBorderTextFieldStyle())
          
          // Slot mail
          HStack{
            Text("Email")
            Spacer()
          }
          .padding(.top, 5)
          
          TextField("Введите Email", text: $mail)
            .textFieldStyle(RoundedBorderTextFieldStyle())
          
          // Slot phone
          HStack{
            Text("Телефон")
            Spacer()
          }
          .padding(.top, 5)
          
          TextField("Введите телефон", text: $phone)
            .textFieldStyle(RoundedBorderTextFieldStyle())
          
          // Slot password
          HStack{
            Text("Пароль")
            Spacer()
          }
          .padding(.top, 5)
          
          SecureField("Введите пароль", text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
          
          // Slot repeat password
          HStack{
            Text("Повтор пароля")
            Spacer()
          }
          .padding(.top, 5)
          
          SecureField("Введите пароль", text: $passwordRepeat)
            .textFieldStyle(RoundedBorderTextFieldStyle())
          
          // Registration button
          Button(action: {
            // Действие, которое нужно выполнить при нажатии на кнопку
          }) {
            Text("Регистрация")
              .font(.system(size: 30))
              .foregroundColor(.white)
              .bold()
          }
          .frame(width: 373, height: 50)
          .background(Color.scarlet)
          .clipShape(RoundedRectangle(cornerRadius: 15))
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
}

#Preview {
  RegistrationView()
}
