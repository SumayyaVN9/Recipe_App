//
//  model.swift
//  reciepeAppExam
//
//  Created by ddukk15 on 03/11/25.
//

import Foundation

struct recipeModel : Identifiable{
    var id = UUID()
    var name : String
    var img : String
    var cookingTime : String
    var ingredients : [String]
}
