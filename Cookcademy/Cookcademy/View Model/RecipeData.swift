//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Parker Joseph Alexander on 2/15/24.
//

import Foundation

class RecipeData: ObservableObject {
    
    @Published var recipes = Recipe.testRecipes
    
    func recipes(for category: MainInformation.Category) -> [Recipe]{
        var filteredRecipes = [Recipe]()
        for recipe in recipes{
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
    
    func add(recipe: Recipe) {
        if recipe.isValid {
            recipes.append(recipe)
        }
    }
}
