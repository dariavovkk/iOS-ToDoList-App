//
//  ProfileView.swift
//  ToDoList
//
//  Created by Polina Prokopenya on 08/06/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    @State private var profilePhotoData: Data? = nil
    var body: some View {
        NavigationView {
            VStack{
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Ładowanie profilu...")
                }
            }
            .navigationTitle("Profil")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        //Info
        
        VStack(alignment: .leading){
            HStack {
                Text("Imię: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Członek od: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
            HStack{
                Text("Student: ").bold()
                Text(user.isStudySelected ? "Tak" : "Nie")
            }
            .padding()
        }
        .padding()
        
        // Sign out
        Button("Wyloguj się"){
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
