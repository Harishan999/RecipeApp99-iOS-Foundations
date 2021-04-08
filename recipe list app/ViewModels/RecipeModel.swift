//
//  RecipeModel.swift
//  recipe list app
//
//  Created by Sathiyagowre Chandrakumar on 07/04/2021.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
   
    init() {
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
    }
}
