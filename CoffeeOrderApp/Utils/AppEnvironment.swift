//
//  AppEnvironment.swift
//  CoffeeOrderApp
//
//  Created by Buhle Radzilani on 2024/06/09.
//

import Foundation


//Setting up app environment for testing.


//Enpoints is where exactly are we going
enum Endpoints {
    case allOrders
    
    var path: String{
        switch self{
        case .allOrders:
            return "/test/orders"
        }
    }
}

struct Configuration {
    lazy var environment: AppEnvironment = {
        
        //read value from enviroment variable
        guard let env = ProcessInfo.processInfo.environment["ENV"] else {
            return AppEnvironment.dev
        }
        
        if env == "TEST" {
            return AppEnvironment.test
        }
        
        return AppEnvironment.dev
        
    }()
}

//Finally we use Dev URLs for development and test URLs or environment test for testing.

enum AppEnvironment: String{
    
    case dev
    case test
    
    var baseURL: URL{
        switch self{
        case .dev:
            return URL(string: "https://chestnut-ringed-headstand.glitch.me/test/orders")!
        case .test:
            return URL(string: "https://chestnut-ringed-headstand.glitch.me/test/orders")!
        }
    }
}
