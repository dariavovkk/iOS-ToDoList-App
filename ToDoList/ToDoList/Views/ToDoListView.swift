//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Polina Prokopenya on 08/06/2023.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @State private var selectedTask: ToDoListItem?
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items :[ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Zadania")
            .toolbar{
                Button {
                    //Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
                    
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "xpbgxbzWA5aLe9AE17buIcCuyDt1")
    }
}
