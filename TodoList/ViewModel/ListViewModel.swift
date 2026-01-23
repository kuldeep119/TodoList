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
    @Published var Titles: [ItemModel] = [] {
        didSet{
            SaveData()
        }
    }
    let itemsKey: String = "save"
    
    init(){
        getTitles()
    }

    func getTitles(){
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let SavedData = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.Titles = SavedData
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
    
    func SaveData(){
        if let encodedData = try? JSONEncoder().encode(Titles){
            UserDefaults.standard.set(encodedData, forKey: "save")
        }
        
    }

}

