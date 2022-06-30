//
//  ListView.swift
//  ToDoList
//
//  Created by Divyansh Dwivedi on 30/04/22.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoListView().transition(AnyTransition.opacity.animation(.easeIn))
                
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item).onTapGesture {
                            withAnimation(.linear) {
                                listViewModel.update(item: item)
                            }
                        }
                    }.onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(GroupedListStyle())
            }
        }
     
        .navigationTitle("To Do List 📝")
            .navigationBarItems(
                leading: EditButton() ,
                trailing: NavigationLink("Add", destination: AddView()))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }.environmentObject(ListViewModel())
    }
}

