//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Manya Malhotra on 12/05/2024.
//

import Foundation
import SwiftData

@Model
class ToDoItem {
    var title: String
    var isImportant: Bool
    
    init(title: String, isImportant: Bool = false) {
        self.title = title
        self.isImportant = isImportant
    }
}

