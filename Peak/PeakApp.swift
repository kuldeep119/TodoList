//
//  TodoListApp.swift
//  TodoList
//
//  Created by kuldeep Singh on 07/01/26.
//

import SwiftUI

@main
struct PeakApp: App {
    
  @StateObject  var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
