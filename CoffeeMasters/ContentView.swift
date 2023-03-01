//
//  ContentView.swift
//  CoffeeMasters
//
//  Created by Greg on 06/02/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var cartManager: CartManager
    
    @State var name = "Picles"
    
    var body: some View {
        TabView{
            MenuPage()
                .tabItem {
                    Image(systemName: "cup.and.saucer")
                    Text("Menu")
                }
            OffersPage()
                .tabItem {
                    Image(systemName: "tag")
                    Text("Offers")
                }
            OrderPage(name: "John Doe", phone: "(11) 99999-9999")
                .tabItem {
                    Image(systemName: "cart")
                    Text("Order")
                }.badge(cartManager.products.count)
            InfoPage()
                .tabItem {
                    Image(systemName: "info")
                    Text("Info")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CartManager())
    }
}
