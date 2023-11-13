//
//  InputView.swift
//  SocialRating
//
//  Created by Тимур Хазеев on 11.11.2023.
//
// Страница входа

import SwiftUI

struct InputView: View {
  
  @State var mail = ""
  @State var password = ""
  
  var body: some View {
    NavigationView {
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
        
        // Login form
        VStack {
          
          // Title enter
          HStack{
            Text("Войти")
              .font(.system(size: 30))
              .foregroundColor(.scarlet)
              .bold()
            Spacer()
          }
          .padding(.top, 50)
          
          // Slot Email
          VStack {
            HStack{
              Text("Email")
              Spacer()
            }
            .padding(.top, 5)
            
            TextField("Введите Email", text: $mail)
              .textFieldStyle(RoundedBorderTextFieldStyle())
            
            // Slot password
            HStack{
              Text("Пароль")
              Spacer()
            }
            .padding(.top, 5)
            
            SecureField("Введите пароль", text: $password)
              .textFieldStyle(RoundedBorderTextFieldStyle())
            
          }
        }
        
        // Transition to password recovery
        VStack {
          NavigationLink("Забыли пароль?", destination: PasswordRecoveryView().navigationBarBackButtonHidden(true))
            .foregroundColor(.gray)
        }
        .padding()
        
        // Login button
        VStack {
          Button(action: {
            // Действие, которое нужно выполнить при нажатии на кнопку
          }) {
            Text("Войти")
              .font(.system(size: 30))
              .foregroundColor(.white)
              .bold()
          }
          .frame(width: 373, height: 50)
          .background(Color.scarlet)
          .clipShape(RoundedRectangle(cornerRadius: 15))
          
          Spacer()
        }
        
        // Transition to account creation
        VStack {
          HStack {
            Text("У вас ещё нет аккаунта?")
              .foregroundColor(.gray)
            
            NavigationLink("Создать аккаунт", destination: RegistrationView().navigationBarBackButtonHidden(true))
              .foregroundColor(.scarlet)
          }
        }
        .padding(.bottom, 75)
        
      }
      .padding(.horizontal, 10)
    }
    
  }
}

#Preview {
  InputView()
}
