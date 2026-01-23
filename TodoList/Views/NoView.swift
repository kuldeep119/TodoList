//
//  NoView.swift
//  TodoList
//
//  Created by kuldeep Singh on 17/01/26.
//

import SwiftUI

struct NoView: View {
    @State var animate : Bool = false
    var body: some View {
        ScrollView {
            VStack(spacing: 20){
                Text("There is No items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Your Bucket is Empty.Just click on Add button and add bunch of items to your Todo List !")
                    .padding(.bottom,20)
                NavigationLink(destination: AddView()) {
                    Text("Add Item ")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(animate ? Color.red : Color.accentColor)
                        .cornerRadius(20)
                    
                }.padding(.horizontal,animate ? 30 : 50)
                    .shadow(
                        color: animate ? Color.red.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x:0.0,
                        y:  animate ? 50 : 30  )
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
                 
                    
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func addAnimation(){
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5 ){
            withAnimation(
                .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
            
        }
    }
}

#Preview {
    NavigationView {
        NoView()
    }.navigationTitle("Title")
}
   
