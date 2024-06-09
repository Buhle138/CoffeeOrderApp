//
//  ContentView.swift
//  CoffeeOrderApp
//
//  Created by Buhle Radzilani on 2024/06/08.
//

import SwiftUI

struct ContentView: View {
    //Getting access to the coffee model through the environment object.
    @EnvironmentObject private var model: CoffeeModel
    
    private func populateOrders() async {
        do {
            try await model.populateOrders()
        }catch {
            print(error)
        }
        
    }
    
    var body: some View { 
        VStack{
            if model.orders.isEmpty{
                Text("No orders available!").accessibilityIdentifier("noOrdersText")
            }else{
                List(model.orders) {order in
                    OrderCellView(order: order)
                }
            }
        }.task {
            await populateOrders()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        var config = Configuration()
        
        ContentView().environmentObject(CoffeeModel(webservice: Webservice(baseURL: config.environment.baseURL)))
    }
}

