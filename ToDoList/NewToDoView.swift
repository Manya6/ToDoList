//
//  NewToDoView.swift
//  ToDoList
//
//  Created by Manya Malhotra on 12/05/2024.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    @Bindable var toDoItem: ToDoItem
    @Binding var showNewTask: Bool
    @Environment(\.modelContext) var modelContext
    var body: some View {
        ZStack{
            Color(red: 198/255, green: 226/255, blue: 233/255)
                .ignoresSafeArea()
            VStack {
                Text("Task Title:")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.black))
                TextField("Enter the task description...", text: $toDoItem.title, axis: .vertical)
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(15)
                    .padding()
                Toggle(isOn: $toDoItem.isImportant) {
                    Text("Is it important?")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                Button {
                    addToDo()
                    self.showNewTask = false
                } label: {
                    Text("Save")
                }                .buttonStyle(.borderedProminent)
                .tint(Color(red: 241/255, green: 255/255, blue: 196/255))
                .foregroundStyle(Color(.black))

            }
            .padding()
        }
    }
    func addToDo() {
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        modelContext.insert(toDo)
    }
}


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ToDoItem.self, configurations: config)

    let toDo = ToDoItem(title: "Example ToDo", isImportant: false)
    return NewToDoView(toDoItem: toDo, showNewTask: .constant(true))
        .modelContainer(container)
}

