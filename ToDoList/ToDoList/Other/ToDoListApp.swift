//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Polina Prokopenya on 08/06/2023.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
