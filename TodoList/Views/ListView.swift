//
//  ListView.swift
//  TodoList
//
//  Created by 王详 on 2023/10/8.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    
    var body: some View {
        // 列表
        List {
            // for循环 类似 v-for
            ForEach(listViewModel.items) { item in
                // 对子view的引用
                ListRowView(item: item)
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        // 标题
        .navigationTitle("Todo List 📋")
        // 菜单栏内容
        .navigationBarItems(
            // 首
            leading: EditButton(),
            // 尾
            trailing:
                // 跳转到新的页面
                NavigationLink(
                    // 展示内容
                    "Add",
                    // 实际的跳转内容
                    destination: AddView()
                )
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

