//
//  ShoppingListView.swift
//  reciepeAppExam
//
//  Created by ddukk15 on 03/11/25.
//

import SwiftUI
import Foundation

class ShoppingList : ObservableObject{
    @Published var recipes : [recipeModel] = []

    func addRecipe (_ recipe:recipeModel){
        if !recipes.contains(where: {$0.id == recipe.id}){
            recipes.append(recipe)
        }
    }
    func removerecipe(at offsets: IndexSet){
        recipes.remove(atOffsets: offsets)
    }
}




struct ShoppingListView: View {
    @ObservedObject var shoppingList: ShoppingList   //ShoppingList clss name
    var body: some View {
        NavigationView{
            List{
                if shoppingList.recipes.isEmpty{
                    Text("Cart Is Empty")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .bold()
                        .italic()
                }else{
                    ForEach(shoppingList.recipes) { recipe in
                    NavigationLink(destination: recipeDetails(recipe: recipe, shoppingList:shoppingList)){
                        HStack{
                            Image(recipe.img)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80.0)
                                .shadow(radius: 10)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            Text(recipe.name)
                                .font(.headline)
                                .fontWeight(.heavy)
                                .fontWeight(.bold)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                                .bold()
                                .padding(.leading)
                        }
                    }
                }
                    .onDelete(perform: shoppingList.removerecipe)
                }
            }.navigationTitle("Shopping List")
        }
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView(shoppingList: ShoppingList())
    }
}
