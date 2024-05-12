//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Manya Malhotra on 12/05/2024.
//

import SwiftUI
import SwiftData

@main
struct ToDoList: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
