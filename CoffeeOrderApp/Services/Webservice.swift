//
//  Webservice.swift
//  CoffeeOrderApp
//
//  Created by Buhle Radzilani on 2024/06/08.
//

import Foundation

enum NetworkError: Error{
    case badRequest
    case decodingError
    case badUrl
}

class Webservice{
    
    func getOrders() async throws -> [Order] {
  
        guard let url = URL(string: "https://chestnut-ringed-headstand.glitch.me/test/orders") else{
            throw NetworkError.badUrl
        }
        
        let(data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else{
            throw NetworkError.badRequest
        }
        
        guard let orders = try? JSONDecoder().decode([Order].self, from: data) else{
            throw NetworkError.decodingError
        }
        
        return orders
        
    }
    
}
