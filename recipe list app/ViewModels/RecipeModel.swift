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
    
    static func getPortion(ingredient: Ingredient,recipeServings: Int, targetServings: Int) -> String {
        
        // Get a single serving by mutiplying denominator by the recipe servings
        
        // Get target portion by multiplying numerator by target servings
        
        // Reduce fraction by greatest common divisor
        
        // Get the whole portion if numerator > demoninator
        
        // Express the reminder as a fraction
        return String(targetServings)
    }
}
