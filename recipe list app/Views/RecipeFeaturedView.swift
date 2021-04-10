//
//  RecipeFeaturedView.swift
//  recipe list app
//
//  Created by Sathiyagowre Chandrakumar on 10/04/2021.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model: RecipeModel
    @State var isDetailViewShowing = false
    var body: some View {
        VStack(alignment: .leading) {
            
           Text("Featured Recipes")
            .bold()
            .padding(.leading)
            .padding(.top, 40)
            .font(.largeTitle)
            
        GeometryReader { geo in
        TabView {
            // Loop through each recipe
            ForEach(0..<model.recipes.count) { index in
                // Only show those that are featured
                if model.recipes[index].featured == true {
                    // Recipe card Button
                    Button(action: {
                        // Show the recipe detail sheet
                        self.isDetailViewShowing = true
                    }, label: {
                        ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                           
                                VStack(spacing: 0) {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                }
                                
                            }
                    
                    }).sheet(isPresented: $isDetailViewShowing) {
                    // Show the RecipeDetailView
                        RecipeDetailView(recipe: model.recipes[index])
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: geo.size.width - 40, height: geo.size.height - 100)
                    .cornerRadius(15)
                    .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                    
                }
            }
         
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
            VStack(alignment: .leading, spacing: 10) {
                Text("Preperation Time:")
                    .font(.headline)
                Text("1 hour")
                Text("HighLights")
                    .font(.headline)
                Text("Healthy")
            }.padding([.leading, .bottom])
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
