//
//  InputView.swift
//  SocialRating
//
//  Created by Тимур Хазеев on 11.11.2023.
//
// Страница входа

import SwiftUI

struct InputView: View {
  
  @State var name = ""
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
          .padding(.horizontal, 25)
          .padding(.top, 50)
          
          // Title Email
          VStack {
            HStack{
              Text("Email")
              Spacer()
            }
            .padding(.horizontal, 25)
            .padding(.top, 5)
            
            // Field for mail
            TextField("Введите Email", text: $name)
              .textFieldStyle(RoundedBorderTextFieldStyle())
              .padding()
            
            // Title password
            HStack{
              Text("Пароль")
              Spacer()
            }
            .padding(.horizontal, 25)
            .padding(.top, 5)
            
            // Field for the password
            SecureField("Введите пароль", text: $password)
              .textFieldStyle(RoundedBorderTextFieldStyle())
              .padding()
          }
        }
        
        // Transition to password recovery
        VStack {
            NavigationLink("Забыли пароль?", destination: PasswordRecoveryView())
              .foregroundColor(.gray)
        }
        .padding()
        
        // Login button
        VStack{
          Button(action: {
            // Действие, которое нужно выполнить при нажатии на кнопку
          }) {
            ZStack {
              Text("Войти")
                .font(.system(size: 30))
                .foregroundColor(.white)
                .bold()
            }
          }
          .frame(minWidth: 0, maxWidth: .infinity)
          .background(Color.scarlet)
          .clipShape(RoundedRectangle(cornerRadius: 15))
          .padding(.horizontal, 25)
          
          Spacer()
        }
        
        // Transition to account creation
        VStack {
          HStack {
            Text("У вас ещё нет аккаунта?")
              .foregroundColor(.gray)
            
            NavigationLink("Создать аккаунт", destination: RegistrationView())
              .foregroundColor(.scarlet)
          }
        }
        .padding(.bottom, 75)
        
      }
    }
    
  }
}

#Preview {
    InputView()
}
