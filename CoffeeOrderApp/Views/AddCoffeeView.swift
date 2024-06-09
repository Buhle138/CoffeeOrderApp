//
//  AddCoffeeView.swift
//  CoffeeOrderApp
//
//  Created by Buhle Radzilani on 2024/06/09.
//

import SwiftUI

struct AddCoffeeView: View {
    @State private var name: String = ""
    @State private var coffeeName: String = ""
    @State private var price: String = ""
    @State private var coffeeSize: CoffeeSize = .medium
    
    var body: some View {
        Form{
            TextField("Name", text: $name)
                .accessibilityIdentifier("name")
            TextField("Coffee Name", text: $name)
                .accessibilityIdentifier("coffeeName")
            TextField("Price", text: $name)
                .accessibilityIdentifier("price")
            Picker("Select size", selection: $coffeeName){
                ForEach(CoffeeSize.allCases, id: \.rawValue){size in
                    Text(size.rawValue).tag(size) //any value added to this tag will be added to the $coffeeName.
                }
            }
            .pickerStyle(.segmented)
            
            Button("Place Order"){
                
            }.accessibilityIdentifier("placeOrderButton")
                .centerHorizontally()
        }
    }
}

struct AddCoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeView()
    }
}
