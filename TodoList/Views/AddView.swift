//
//  AddView.swift
//  TodoList
//
//  Created by kuldeep Singh on 09/01/26.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel:ListViewModel
    @State var AddItem : String = ""
    
    @State var alertTitle: String = ""
    @State var ShowAlert: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                TextField("Add Items from here", text: $AddItem)
                    .padding(.horizontal)
                    .frame(height:50)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button {SaveButtom()} label: {
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
        .alert(isPresented: $ShowAlert, content:getAlert)
            
    }
    func SaveButtom() {
        if appropriateText(){
            listViewModel.addItem(title: AddItem )
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    func appropriateText() -> Bool{
        if AddItem.count < 3 {
            alertTitle = "Title should be more than 3 charaters"
            ShowAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    Group {
        NavigationStack{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
