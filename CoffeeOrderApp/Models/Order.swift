//
//  Order.swift
//  CoffeeOrderApp
//
//  Created by Buhle Radzilani on 2024/06/08.
//

import Foundation

enum CoffeeSize: String, Codable, CaseIterable{
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
}

struct Order: Codable, Identifiable, Hashable {
    
    //Making the Id nullable because when you are creating the order you don't have
    //the id at that time meaning its null at that time.
    var id: Int?
    var name: String
    var coffeeName: String
    var total: Double
    var size: CoffeeSize
    
    
}
