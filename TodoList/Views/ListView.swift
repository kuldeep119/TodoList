//
//  ListView.swift
//  TodoList
//
//  Created by kuldeep Singh on 08/01/26.
//

import SwiftUI

struct ListView: View {
    @State var Titles:[String] = ["Hi buddy", "Hello buddy", "Hey buddy"]
    var body: some View {
        List{
            ForEach(Titles, id: \.self) { title in
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
