//
//  RegisterView.swift
//  ToDoList
//
//  Created by Polina Prokopenya on 08/06/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    //@State private var isStudySelected = false
    
    var body: some View {
        VStack{
            //Header
            HeaderView(title: "Zarejestruj się", subtitle: "Zacznij zarządzanie", angle: -15, background: .orange)
            
            Form {
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                }
                TextField("Imię", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Hasło", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Section {Toggle("Studiujesz?", isOn: $viewModel.isStudySelected)}
                    
                TLButton(title: "Zarejestruj się", background: .blue) {
                    viewModel.register()}
                .padding()
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
