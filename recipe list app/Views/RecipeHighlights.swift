//
//  RecipeHighlights.swift
//  recipe list app
//
//  Created by Sathiyagowre Chandrakumar on 10/04/2021.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allhighlights = ""
    
    init(highlights: [String]) {
      // Loop through the highlights and build the string
        for index in 0..<highlights.count {
            // if this is the last item don't add the comma
            if index == highlights.count - 1 {
                allhighlights += highlights[index]
            } else {
                allhighlights += highlights[index] + ", "
            }
        }
    }
    var body: some View {
        Text(allhighlights)
            .font(Font.custom("Avenir", size: 15))
        
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test", "test2", "test3"])
    }
}
