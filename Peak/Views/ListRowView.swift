//
//  ListRowView.swift
//  TodoList
//
//  Created by kuldeep Singh on 08/01/26.
//

import SwiftUI

struct ListRowView: View {
    let Title : ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: Title.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(Title.isCompleted ? .green : .red)
            Text(Title.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}

#Preview {
    let  Title1 = ItemModel(title: "First", isCompleted: false )
    let Title2 = ItemModel(title: "Second", isCompleted: true )
    Group{
        ListRowView(Title: Title1)
        ListRowView(Title: Title2)
    }
}
