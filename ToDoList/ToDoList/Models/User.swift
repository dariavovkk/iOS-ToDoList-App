//
//  User.swift
//  ToDoList
//
//  Created by Polina Prokopenya on 08/06/2023.
//

import Foundation
struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    let isStudySelected: Bool
}
