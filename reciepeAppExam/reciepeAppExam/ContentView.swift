//
//  ContentView.swift
//  reciepeAppExam
//
//  Created by ddukk15 on 03/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var shoppingList = ShoppingList()
    var body: some View {
        TabView{
            ReciepiesView(shoppingList: shoppingList)
                .tabItem{
                    Label("Recipe",systemImage: "book.fill")
                }
            ShoppingListView(shoppingList: shoppingList)
                .tabItem{
                    Label("Cart",systemImage: "cart.fill")
                } }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
