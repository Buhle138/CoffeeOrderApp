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
            List(model.orders) {order in
                OrderCellView(order: order)
            }.task {
                await populateOrders()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CoffeeModel(webservice: Webservice()))
    }
}

struct OrderCellView: View{
    let order: Order
    
    var body: some View{
        
    
        HStack{
            VStack(alignment: .leading){
                Text(order.name).accessibilityIdentifier("orderNameText")
                    .bold()
                Text("\(order.coffeeName) (\(order.size.rawValue)")
                    .accessibilityIdentifier("CoffeeNameAndSizeText")
                    .opacity(0.5)
            }
            Spacer()
           // Text(order.total as NSNumber, formatter: NumberFormatter.currency)
             //   .accessibilityIdentifier("CoffeePriceText")
        }
    }
}
