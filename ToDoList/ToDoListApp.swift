//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Divyansh Dwivedi on 30/04/22.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }

    }
}
