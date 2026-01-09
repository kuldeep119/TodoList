//
//  AddView.swift
//  TodoList
//
//  Created by kuldeep Singh on 09/01/26.
//

import SwiftUI

struct AddView: View {
    @State var AddItem : String = ""
    var body: some View {
        ScrollView {
            VStack {
                TextField("Add Items from here", text: $AddItem)
                    .padding(.horizontal)
                    .frame(height:50)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button {
                    
                } label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }
            .padding()
        }
        .navigationTitle("Add an Item 🖋️")
    }
}

#Preview {
    NavigationStack{
        AddView()
    }
}
