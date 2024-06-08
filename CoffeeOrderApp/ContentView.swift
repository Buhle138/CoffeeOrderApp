//
//  ContentView.swift
//  CoffeeOrderApp
//
//  Created by Buhle Radzilani on 2024/06/08.
//

import SwiftUI

struct ContentView: View {
    //Getting access to the coffee model through the environment object. 
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CoffeeModel(webservice: Webservice()))
    }
}
