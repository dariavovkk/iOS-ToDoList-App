//
//  SingleTaskView.swift
//  ToDoList
//
//  Created by Polina Prokopenya on 11/06/2023.
//

import SwiftUI

struct SingleTaskView: View {
    let task: ToDoListItem
    
    var body: some View {
        Text(task.title)
            .font(.title)
    }
}

struct SingleTaskView_Previews: PreviewProvider {
    static var previews: some View {
        SingleTaskView(task: ToDoListItem(id: "123", title: "Zakupy", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
    }
}
