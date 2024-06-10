//
//  String+Extensions.swift
//  CoffeeOrderApp
//
//  Created by Buhle Radzilani on 2024/06/10.
//

import Foundation


extension String {
    
    var isNumeric: Bool {
        Double(self) != nil
    }
    
    var isNotEmpty: Bool {
        !self.isEmpty
    }
    
    func isLessThan(_ number: Double) -> Bool {
        if !self.isNumeric {
            return false //if it's not a number return false
        }
        
        guard let value = Double(self) else {return false}
        return value < number //return true if the value is less than number, otherwise return false.
    }
    
}
