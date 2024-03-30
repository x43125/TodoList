//
//  ItemModel.swift
//  TodoList
//
//  Created by 王详 on 2024/3/30.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isComplete: Bool
}
