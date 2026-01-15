//
//  ItemModel.swift
//  TodoList
//
//  Created by kuldeep Singh on 10/01/26.
//

import Foundation

struct ItemModel:Identifiable {
    var id : String = UUID().uuidString
    let title : String
    let isCompleted : Bool
    
    init(id: String = UUID().uuidString,title: String, isCompleted: Bool) {
        self.id  = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel{
        return ItemModel(id: string,title: title, )
    }
}
