//
//  MenuManager.swift
//  CoffeeMasters
//
//  Created by Greg on 07/02/23.
//

import Foundation
import Alamofire

class MenuManager: ObservableObject {
    @Published var menu: [Category] = []
    
    init() {
        refreshItems()
    }
    
    func refreshItems() {
        print("Start to download items ====>>>>>")
        AF.request("https://firtman.github.io/coffeemasters/api/menu.json")
            .responseDecodable(of: [Category].self) { response in
                if let menuFromNetwork = response.value {
                    print(menuFromNetwork)
                    self.menu = menuFromNetwork
                }
            }
    }
}
