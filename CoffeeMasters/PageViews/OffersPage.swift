//
//  OffersPage.swift
//  CoffeeMasters
//
//  Created by Greg on 07/02/23.
//

import SwiftUI

struct OffersPage: View {
    var body: some View {
        NavigationView {
            List{
                Offer(title: "Title1", description: "Description1")
                Offer(title: "Title2", description: "Description2")
                Offer(title: "Title2", description: "Description2")
                Offer(title: "Title2", description: "Description2")
                Offer(title: "Title2", description: "Description2")
                Offer(title: "Title2", description: "Description2")
                Offer(title: "Title2", description: "Description2")
            }.navigationTitle("Offers")
        }
       
    }
}

struct OffersPage_Previews: PreviewProvider {
    static var previews: some View {
        OffersPage()
    }
}
