//
//  ContentView.swift
//  CoffeeOrderApp
//
//  Created by Buhle Radzilani on 2024/06/08.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
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
        NavigationStack {
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
            .sheet(isPresented: $isPresented, content: {
                AddCoffeeView()
            })
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Add New Order"){
                        //If isPresented is true then we display the add new orders in the form of a sheet. 
                        isPresented = true
                    }.accessibilityIdentifier("addNewOrderButton")
                }
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        var config = Configuration()
        
        ContentView().environmentObject(CoffeeModel(webservice: Webservice(baseURL: config.environment.baseURL)))
    }
}

