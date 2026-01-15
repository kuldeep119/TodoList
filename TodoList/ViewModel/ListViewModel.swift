//
//  ListViewModel.swift
//  TodoList
//
//  Created by kuldeep Singh on 12/01/26.
//

import Foundation
import SwiftUI
import Combine

class ListViewModel : ObservableObject {
    @Published var Titles: [ItemModel] = []
    init(){
        getTitles()
    }

    func getTitles(){
        let newTitles = [
            ItemModel(title: "Hey", isCompleted: false),
            ItemModel(title: "Hello", isCompleted: true ),
            ItemModel(title: "Hiii", isCompleted: true)
        ]
        Titles.append(contentsOf: newTitles)
    }

    func deleteItem(IndexSet:IndexSet){
        Titles.remove(atOffsets: IndexSet)
    }
    func moveItems(from: IndexSet, to:Int){
        Titles.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title:String){
        let newTitle = ItemModel(title: title, isCompleted: false)
        Titles.append(newTitle)
    }
    func updateItem(item : ItemModel ){
        if let index = Titles.firstIndex(where:{$0.id==item.id}){
            Titles[index] = item.updateCompletion()
        }
    }

}

