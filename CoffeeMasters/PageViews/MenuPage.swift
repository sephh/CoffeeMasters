//
//  HomePage.swift
//  CoffeeMasters
//
//  Created by Greg on 07/02/23.
//

import SwiftUI

struct MenuPage: View {
    @EnvironmentObject var menuManager: MenuManager
    
    var body: some View {
        NavigationView{
            List{
                ForEach(menuManager.menu) { category in
                    Text(category.name)
                    
                    ForEach(category.products){ product in
                        NavigationLink{
                            DetailsPage(product: product)
                        } label: {
                            ProductItem(product: product)
                        }
                    }
                    
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Products")
            .background(Color("SurfaceBackground"))
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        MenuPage().environmentObject(MenuManager())
    }
}
