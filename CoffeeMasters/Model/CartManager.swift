//
//  CartManager.swift
//  CoffeeMasters
//
//  Created by Greg on 07/02/23.
//

import Foundation

class CartManager: ObservableObject {
    @Published var products: [(Product, Int)] = []
        
    func add(product: Product, quantity: Int) {
        if let currentIndex = products.firstIndex(where: { internalProduct, internalQuantity in
            product.id == internalProduct.id
        }) {
            var currentItem = products[currentIndex]
            
            currentItem.1 = currentItem.1 + quantity
            
            products[currentIndex] = currentItem
        } else {
            products.append((product, quantity))
        }
        
    }
        
    func remove(product: Product) {
        products.removeAll { productInCart in
            productInCart.0.id == product.id
        }
    }
    
    func clear() {
        products.removeAll()
    }
    
    func total() -> Double {
        var total = 0.0
        for item in products {
            total += item.0.price * Double(item.1)
        }
        return total
    }
}
