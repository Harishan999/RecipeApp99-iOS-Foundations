//
//  RecipeTabView.swift
//  recipe list app
//
//  Created by Sathiyagowre Chandrakumar on 08/04/2021.
//

import SwiftUI

struct RecipeTabView: View {
    @State var selectedTab = Constants.featuredTab
    var body: some View {
        TabView(selection: $selectedTab) {
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
                .tag(Constants.featuredTab)
            
            RecipeCategoryView(selectedTab: $selectedTab)
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.2x2")
                        Text("Categories")
                    }
                }
                .tag(Constants.categoriesTab)
            
            
            RecipeListView()
                .tabItem {
                    VStack {
                    Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
                .tag(Constants.listTab)
            
        }.environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
