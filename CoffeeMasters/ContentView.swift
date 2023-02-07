//
//  ContentView.swift
//  CoffeeMasters
//
//  Created by Greg on 06/02/23.
//

import SwiftUI

struct ContentView: View {
    @State var name = "Picles"
    
    var body: some View {
        VStack {
           TextField("Enter your name", text: $name)
            Text("Helo \(name)")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
