//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Parker Joseph Alexander on 2/16/24.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    private let backgroundColor = AppColor.background
    private let textColor = AppColor.foreground
    var body: some View {
        VStack{
            HStack{
                Text("Author: \(recipe.mainInformation.author)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            HStack{
                Text(recipe.mainInformation.description)
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            List{
                Section(header: Text("Ingredients")){
                    ForEach(recipe.ingredients.indices, id: \.self) { index in let ingredient = recipe.ingredients[index]
                        Text(ingredient.description)
                    }
                    .foregroundColor(textColor)
                }.listRowBackground(backgroundColor)
            }
            List{
                Section(header: Text("Directions")){
                    ForEach(recipe.directions.indices, id: \.self){
                        index in let direction = recipe.directions[index]
                        HStack{
                            Text("\(index + 1). ").bold()
                            Text("\(direction.isOptional ? "(Optional) " : "" + direction.description)")
                        }
                    }.foregroundColor(textColor)
                } .listRowBackground(backgroundColor)
            }
        }
        
       
        .navigationTitle(recipe.mainInformation.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
  @State static var recipe = Recipe.testRecipes[0]
  static var previews: some View {
    NavigationView {
      RecipeDetailView(recipe: recipe)
    }
  }
}
//#Preview {
//    @State static var recipe = Recipe.testRecipes[0]
//      static var previews: some View {
//        NavigationView {
//          RecipeDetailView(recipe: recipe)
//        }
//      }
//    
//    
//}

