//
//  OrderItem.swift
//  CoffeeMasters
//
//  Created by Greg on 08/02/23.
//

import SwiftUI

struct OrderItem: View {
    var product: Product
    var quantity: Int
    @EnvironmentObject var cartManager: CartManager;
    
    var body: some View {
        HStack{
            Text("\(product.name) x \(quantity)")
            Spacer()
            Text("$ \(product.price * Double(quantity), specifier: "%.2f")")
            Image(systemName: "trash")
                .foregroundColor(Color("Secondary"))
                .onTapGesture {
                    cartManager.remove(product: product)
                }
        }
    }
}

struct OrderItem_Previews: PreviewProvider {
    static var previews: some View {
        OrderItem(product: Product(id: 111, name: "Picles", price: 11), quantity: 2)
            .environmentObject(CartManager())
    }
}
