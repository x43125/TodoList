//
//  ListViewModel.swift
//  TodoList
//
//  Created by 王详 on 2024/4/8.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() { 
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemModel(title: "This is the first title!", isComplete: false),
//            ItemModel(title: "This is the second!", isComplete: true),
//            ItemModel(title: "Third!", isComplete: true),
//        ]
//
//        items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {
            return
        }
        
        self.items = savedItems
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
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
