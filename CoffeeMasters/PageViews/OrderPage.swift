//
//  CartPage.swift
//  CoffeeMasters
//
//  Created by Greg on 07/02/23.
//

import SwiftUI

struct OrderPage: View {
    
    @State var name: String
    @State var phone: String
    @State var orderConfirmed = false
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationView{
            if cartManager.products.count == 0 {
                Text("Your order is empty")
                    .navigationTitle("Your Order")
            } else {
                List{
                    Section("Items"){
                        ForEach(cartManager.products, id:\.0.id){ item in
                            OrderItem(product: item.0, quantity: item.1)
                        }
                    }.listRowBackground(Color("Background"))
                    
                    Section("Your Details") {
                        VStack {
                            TextField("Your Name", text: $name)
                                .textFieldStyle(.roundedBorder)
                            Spacer().frame(height: 20)
                            TextField("Your Phone #", text: $phone)
                                .keyboardType(.phonePad)
                                .textFieldStyle(.roundedBorder)
                        }.padding(.top)
                            .padding(.bottom)
                    }.listRowBackground(Color("Background"))
                    
                    Section() {
                        HStack {
                            Spacer()
                            Text("Total")
                            Spacer()
                            Text("$ \(cartManager.total(), specifier: "%.2f")")
                                .bold()
                            Spacer()
                        }
                    }.listRowBackground(Color.clear)
                    
                    Section {
                        HStack {
                            Spacer()
                            Button("Place Order") {
                                orderConfirmed = true
                            }
                            .padding()
                            .frame(width: 250.0)
                            .background(Color("Alternative2"))
                            .foregroundColor(Color.black)
                            .cornerRadius(25)
                            
                            Spacer()
                        }
                    }.listRowBackground(Color.clear)
                }
                .listSectionSeparatorTint(Color("AccentColor"))
                .listStyle(.insetGrouped)
                .navigationTitle("Your Order")
                .alert("Order", isPresented: $orderConfirmed, actions: {
                    Button("OK", role: .cancel) {
                        //TODO: send order
                        orderConfirmed = false
                        cartManager.clear()
                    }
                }, message: {
                    Text("Your order is being prepared.")
                        .font(.title)
                })
                
            }
        }
    }
}

struct CartPage_Previews: PreviewProvider {
    static var previews: some View {
        OrderPage(name: "John Doe", phone: "(11) 99999-9999")
            .environmentObject(CartManager())
    }
}
