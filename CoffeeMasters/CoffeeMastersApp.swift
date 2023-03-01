//
//  CoffeeMastersApp.swift
//  CoffeeMasters
//
//  Created by Greg on 06/02/23.
//

import SwiftUI

@main
struct CoffeeMastersApp: App {
    var cartManager = CartManager()
    var menuManager = MenuManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cartManager)
                .environmentObject(menuManager)
        }
    }
}
