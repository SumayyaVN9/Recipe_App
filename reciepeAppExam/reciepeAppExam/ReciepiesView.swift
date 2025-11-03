//
//  ReciepiesView.swift
//  reciepeAppExam
//
//  Created by ddukk15 on 03/11/25.
//

import SwiftUI

let recipes = [
    recipeModel(name: "Biriyani", img: "Biriyani", cookingTime: "30 min", ingredients: ["Chicken (cut pieces)", "Basmati rice", "Yogurt", "Onions (sliced, for birista)", "Tomatoes (optional)", "Ginger-garlic paste", "Green chilies", "Fresh cilantro (coriander)", "Fresh mint leaves", "Lemon juice", "Ghee or oil", "Salt", "Bay leaves", "Green cardamom pods", "Cloves", "Cinnamon sticks", "Mace (optional)", "Star anise (optional)", "Cumin seeds (optional)", "Black peppercorns (optional)", "Turmeric powder", "Red chili powder", "Coriander powder (optional)", "Garam masala powder", "Ground cumin (optional)", "Saffron (soaked in milk, optional)", "Rose or kewra water (optional)", "Fried cashews (optional)", "Raisins (optional)", "Hard-boiled eggs (optional)", "Potato (optional)"]),
    recipeModel(name: "Pizza", img: "Pizza", cookingTime: "30 min", ingredients: ["Pizza dough (or pizza base)", "Tomato sauce (pizza sauce or passata)", "Mozzarella cheese (fresh or shredded)", "Olive oil", "Salt", "Black pepper", "Dried oregano", "Fresh basil leaves", "Garlic (optional)", "Parmesan cheese (optional)", "Tomato paste (optional, to thicken sauce)"]),
    recipeModel(name: "vegfriedrice", img: "vegfriedrice", cookingTime: "30 min", ingredients: ["Basmati rice (or long-grain rice)", "Vegetable oil (or sesame oil)", "Garlic (minced)", "Ginger (minced, optional)", "Onion (finely chopped)", "Mixed vegetables (carrots, peas, beans, corn — diced)", "Bell pepper (capsicum, diced)", "Spring onions (scallions — white + green parts, sliced)", "Soy sauce", "Salt", "Black pepper", "Eggs (optional, for egg fried rice)", "Sesame oil (optional, for flavor)", "Green chili (optional, finely chopped)", "Vinegar (rice vinegar or white vinegar, optional)", "Sugar (a pinch, optional)", "Garnish: chopped cilantro (coriander) or extra spring onion"]),
    recipeModel(name: "eggCurry", img: "eggCurry", cookingTime: "30 min", ingredients: ["Eggs (hard-boiled)", "Onion (finely chopped)", "Tomato (pureed or chopped)", "Ginger-garlic paste", "Green chilies (slit, optional)", "Cooking oil or ghee", "Turmeric powder", "Red chili powder", "Coriander powder", "Cumin powder (optional)", "Garam masala", "Salt", "Fresh cilantro (coriander) leaves", "Curry leaves (optional)", "Mustard seeds (optional)", "Cumin seeds (optional)", "Whole spices (bay leaf, cinnamon, cardamom — optional)", "Yogurt or coconut milk (optional, for creaminess)", "Water or stock"]),
    recipeModel(name: "chikenFry", img: "chikenFry", cookingTime: "30 min", ingredients: ["Chicken pieces (drumsticks/thighs or cut pieces)", "Salt", "Black pepper", "Turmeric powder", "Red chili powder or paprika", "Ginger-garlic paste", "Yogurt or buttermilk (for marinade)", "Cornstarch (or rice flour) or all-purpose flour (for coating)", "Eggs (optional, for batter)", "Oil for deep-frying (vegetable/peanut/canola)", "Lemon (for serving)", "Fresh cilantro or parsley (optional, for garnish)"]),
    recipeModel(name: "eggomelette", img: "eggomelette", cookingTime: "30 min", ingredients:["Eggs", "Salt", "Black pepper", "Butter or cooking oil", "Milk or water (optional, to make eggs fluffier)", "Onion (optional, finely chopped)", "Tomato (optional, diced)", "Bell pepper (optional, diced)", "Cheese (optional, grated — e.g., cheddar)", "Fresh herbs (optional — parsley, chives, or cilantro)", "Green chili (optional, finely chopped)", "Mushrooms (optional, sliced)", "Spinach (optional, chopped)"])
    
]

struct ReciepiesView:View{
    @ObservedObject var shoppingList = ShoppingList()
    var body:some View{
        NavigationView{
            List(recipes) { recipe in
                NavigationLink(destination: recipeDetails(recipe: recipe,shoppingList: shoppingList))
                {
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
//                    Divider()
                    .padding([.top, .leading, .trailing], 5.0)
                    
                }
            }.padding(.trailing).toolbar{
                ToolbarItem(placement:.principal){
                    Text("Recipe App")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20.0)
                        
                }
            }
//            .navigationTitle("FOODS")
        }
    }
}
struct recipeDetails: View{
    let recipe :recipeModel
    @ObservedObject var shoppingList : ShoppingList
    var body: some View{
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    Text(recipe.name)
                        .font(.title2)
                        .foregroundColor(Color.gray)
                        .bold()
                    Spacer()
                    Button(action: {
                        shoppingList.addRecipe(recipe)
                        
                    }){
                            Text("Cart")
                            .bold()
                            .font(.title2)
                            .foregroundColor(Color.white)
                            .padding(/*@START_MENU_TOKEN@*/.all, 8.0/*@END_MENU_TOKEN@*/)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                }
            Image(recipe.img)
                .resizable()
                .padding(/*@START_MENU_TOKEN@*/[.top, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
                .scaledToFill()
                .shadow(radius: 10)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 300.0, height: 300.0)
                Text("Cooking Time:\(recipe.cookingTime)")
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .bold()
                
            Group{
                Text("Ingredients:")
                    .font(.title3)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                ForEach(recipe.ingredients,id : \.self) { item in
                    Text(". \(item)")
                        .foregroundColor(Color.gray)
                        .font(.headline)
                        .fontWeight(.heavy)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .bold()
                        .padding(.leading)
                }
            }
        }
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ReciepiesView_Previews: PreviewProvider {
    static var previews: some View {
        ReciepiesView()
    }
}

