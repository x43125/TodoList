//
//  TodoListApp.swift
//  TodoList
//
//  Created by 王详 on 2023/10/8.
//

import SwiftUI

/*
 MVVM Architecture
 Model - data point
 View - UI
 ViewModel - manages Models for View
 */
@main
struct TodoListApp: App {
    
    // 可观察变量
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            // 全局变量
            .environmentObject(listViewModel)
        }
    }
}
