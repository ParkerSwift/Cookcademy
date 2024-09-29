//
//  ContentView.swift
//  Cookcademy
//
//  Created by Parker Joseph Alexander on 2/13/24.
//

import SwiftUI


private let listBackgroundColor = AppColor.background
private let listTextColor = AppColor.foreground

struct RecipesListView: View {
    @State private var isPresented: Bool = false
    @State private var newRecipe = Recipe()
    @EnvironmentObject private var recipeData:  RecipeData
    let category: MainInformation.Category
    
    var body: some View {
        NavigationView{
            
            
            List{
                ForEach(recipes) { recipe in NavigationLink(recipe.mainInformation.name,
                                                            destination: RecipeDetailView(recipe: recipe))
                }
                .listRowBackground(listBackgroundColor)
                .foregroundColor(listTextColor)
            }
            .navigationTitle("\(category.rawValue) Recipes")
        }
        
        .toolbar{
            ToolbarItem{
                Button(action: {isPresented = true}, label: {
                    Image(systemName: "plus")
                })
            }
        }.sheet(isPresented: $isPresented)
        {
            NavigationView{
                
                ModifyRecipeView(recipe: $newRecipe)
                    .navigationTitle("Add a New Recipe")
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction){
                            Button(action: {isPresented = false}, label: {
                                Text("Done")
                            })
                           
                        }
                        ToolbarItem{
                            if newRecipe.isValid{
                                Button(action: {
                                    recipeData.add(recipe: newRecipe)
                                    isPresented = false
                                }, label: {
                                    Text("Add")
                                    
                                })
                            }
                        }
                    }
            }
            
        }
    }
        
}
extension RecipesListView {
    private var recipes: [Recipe] {
        recipeData.recipes(for: category)
    }
    private var navigationTitle: String{
        "\(category.rawValue) Recipes"
    }
}



#Preview {
    NavigationView{
        RecipesListView(category: .breakfast)
            .environmentObject(RecipeData())
    }
}

