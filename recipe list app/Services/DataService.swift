//
//  DataService.swift
//  recipe list app
//
//  Created by Sathiyagowre Chandrakumar on 07/04/2021.
//

import Foundation

class DataService {
    
 static func getLocalData() -> [Recipe] {
        // Parse local json file
        
        // Get a url path to the file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        // Check if pathString is not nil otherwise
        
        guard pathString != nil else {
            return [Recipe]()
        }
        // create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        
        do {
            // create a data object
            let data = try Data(contentsOf: url)
            
            
             // Decode the data with a JSON decoder
             let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                
                return recipeData
                
                // Return the recipes
            } catch {
                // error with parsing json
                print(error)
            }
            
  
            
        } catch {
            // error with getting data
            print(error)
        }
        
        return [Recipe]()
    }
}
