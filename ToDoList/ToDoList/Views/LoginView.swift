//
//  LoginView.swift
//  ToDoList
//
//  Created by Polina Prokopenya on 08/06/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "Do zrobienia", subtitle: "Załatw sprawę", angle: 15, background: .blue)
                
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Hasło", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButton(title: "Zaloguj się", background: .orange) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y:-50)
                
                //Create Account
                VStack{
                    Text("Nie masz konta?")
                    NavigationLink("Zarejestruj się", destination: RegisterView())
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
