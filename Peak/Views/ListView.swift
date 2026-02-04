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
                 .navigationBarItems(
                        leading:EditButton() ,
                                        trailing:
                                            NavigationLink("Add ", destination: AddView())
                    )
            }
        }
        .navigationTitle("Today's Mission 📝")
    }
        
}

#Preview {
    NavigationStack{
        ListView()
    }
    .environmentObject(ListViewModel())
}
