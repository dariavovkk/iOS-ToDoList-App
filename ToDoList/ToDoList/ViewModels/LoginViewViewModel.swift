//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Polina Prokopenya on 08/06/2023.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        //Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Proszę wypełnić wszystkie pola."
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Proszę podać poprawny email."
            return false
        }
        return true
    }
}

