//
//  NewItemView.swift
//  ToDoList
//
//  Created by Polina Prokopenya on 08/06/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("Nowe zadanie")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 35)
            Form {
                //Title
                TextField("Nazwa", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Due Data
                DatePicker("Termin", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                TLButton(title: "Zapisz", background: .blue) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Proszę wypełnić wszystkie pola i wybrać termin."))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
