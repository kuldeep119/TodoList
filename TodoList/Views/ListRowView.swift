//
//  ListRowView.swift
//  TodoList
//
//  Created by kuldeep Singh on 08/01/26.
//

import SwiftUI

struct ListRowView: View {
    let Title : String
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle")
            Text(Title)
            Spacer()
        }
    }
}

#Preview {
    ListRowView(Title: "Hiiiii")
}
