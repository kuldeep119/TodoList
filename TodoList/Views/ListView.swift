//
//  ListView.swift
//  TodoList
//
//  Created by kuldeep Singh on 08/01/26.
//

import SwiftUI

struct ListView: View {
    @State var Titles:[ItemModel] = [
        ItemModel(title: "Hey", isCompleted: false),
        ItemModel(title: "Hello", isCompleted: true ),
        ItemModel(title: "Hiii", isCompleted: true)
    ]
    var body: some View {
        List{
            ForEach(Titles){ title in
                ListRowView(Title: title)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(leading:EditButton() ,
                            trailing:
        NavigationLink("Add ", destination: AddView())
        )
    }
}

#Preview {
    NavigationStack{
        ListView()
    }
}
