//
//  ListViewModel.swift
//  TodoList
//
//  Created by 王详 on 2024/4/8.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "This is the first title!", isComplete: false),
            ItemModel(title: "This is the second!", isComplete: true),
            ItemModel(title: "Third!", isComplete: true),
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isComplete: false)
        items.append(newItem)
    }
}
