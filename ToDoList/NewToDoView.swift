//
//  NewToDoView.swift
//  ToDoList
//
//  Created by Manya Malhotra on 12/05/2024.
//

import SwiftUI

struct NewToDoView: View {
    var body: some View {
        ZStack{
            Color(red: 198/255, green: 226/255, blue: 233/255)
                .ignoresSafeArea()
            VStack {
                Text("Task Title:")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.black))
                TextField("Enter the task description...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(15)
                    .padding()
                Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                    Text("Is it important?")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                Button {

                } label: {
                        Text("Save")
        
                }
                .buttonStyle(.borderedProminent)
                .tint(Color(red: 241/255, green: 255/255, blue: 196/255))
                .foregroundStyle(Color(.black))

            }
            .padding()
        }
    }
}

#Preview {
    NewToDoView()
}
