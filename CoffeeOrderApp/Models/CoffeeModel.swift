//
//  CoffeeModel.swift
//  CoffeeOrderApp
//
//  Created by Buhle Radzilani on 2024/06/08.
//

import Foundation

@MainActor //sinced the orders are marked as published we want to execute them on the main thread
class CoffeeModel: ObservableObject{
    
    let webservice: Webservice
    @Published private(set) var orders: [Order] = []
    
    
    init(webservice: Webservice){
        self.webservice = webservice
    }
    
    func populateOrders() async throws {
      orders =  try await webservice.getOrders()
    }
    
}
