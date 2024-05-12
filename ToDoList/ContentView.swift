//
//  ContentView.swift
//  ToDoList
//
//  Created by Manya Malhotra on 12/05/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showNewTask = false
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    var body: some View {
        ZStack{
            Color(red: 167/255, green: 190/255, blue: 211/255)
                .ignoresSafeArea()
            VStack {
                HStack{
                    Text("To Do List")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundStyle(Color(red: 8/250, green: 7/250, blue: 8/250))
                        .font(.title)
                    Spacer()
                    Button {
                        withAnimation {
                                        self.showNewTask = true
                        }
                    } label: {
                        Text("+")
                            .font(.title)
                    }
                    .foregroundColor(Color(red: 59/255, green: 96/255, blue: 228/255))
                    
                    
                }
                List {
                                    ForEach(toDos) { toDoItem in
                                        if toDoItem.isImportant {
                                            Text("‼️" + toDoItem.title)
                                        } else {
                                            Text(toDoItem.title)
                                        }
                                    }
                                    .onDelete(perform: deleteToDo)
                                }
                .listStyle(.plain)
                .cornerRadius(15)
            }
            .padding()
            Spacer()
            
            if showNewTask {
                NewToDoView(toDoItem: ToDoItem(title: "", isImportant: false), showNewTask: $showNewTask)
            }
        }
    }
    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
}

#Preview {
    ContentView()
}
