//
//  ListView.swift
//  TodoList
//
//  Created by kuldeep Singh on 08/01/26.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.Titles.isEmpty{
                NoView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else {
                List{
                    ForEach(listViewModel.Titles){ title in
                        ListRowView(Title: title)
                            .onTapGesture {
                                withAnimation  {
                                    listViewModel.updateItem(item: title)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItems)
                }.listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📝")
            .navigationBarItems(
                
                leading:EditButton() ,
                                trailing:
                                    NavigationLink("Add ", destination: AddView())
            )
        
    }
}

#Preview {
    NavigationStack{
        ListView()
    }
    .environmentObject(ListViewModel())
}
