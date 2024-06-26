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
    
    private var baseURL: URL
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func placeOrder(order: Order) async throws -> Order {
        
        guard let url = URL(string: Endpoints.allOrders.path, relativeTo: baseURL) else{
            throw NetworkError.badUrl
        }
        
        //Making a post request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //telling our server that our request is of type json
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //actual data we are posting to our server
        request.httpBody = try JSONEncoder().encode(order)
        
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else{
            throw NetworkError.badRequest
        }
        
        guard let newOrder = try? JSONDecoder().decode(Order.self, from: data) else{
            throw NetworkError.decodingError
        }
        return newOrder
    }
    
    func getOrders() async throws -> [Order] {
  
        guard let url = URL(string: Endpoints.allOrders.path, relativeTo: baseURL) else{
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
