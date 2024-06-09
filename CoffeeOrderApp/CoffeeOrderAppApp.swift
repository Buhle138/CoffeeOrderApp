//
//  CoffeeOrderAppApp.swift
//  CoffeeOrderApp
//
//  Created by Buhle Radzilani on 2024/06/08.
//

import SwiftUI

@main
struct CoffeeOrderAppApp: App {
    
    @StateObject private var model: CoffeeModel
    
    init(){
        var config = Configuration()
        let webservice = Webservice(baseURL: config.environment.baseURL)
        _model = StateObject(wrappedValue: CoffeeModel(webservice: webservice))
    }
    
    var body: some Scene {
        WindowGroup {
            //This ensures that the coffee model is available in all other views within the application. 
            ContentView().environmentObject(model)
        }
    }
}
