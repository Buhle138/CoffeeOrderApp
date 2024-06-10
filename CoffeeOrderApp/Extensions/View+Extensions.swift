//
//  View+Extensions.swift
//  CoffeeOrderApp
//
//  Created by Buhle Radzilani on 2024/06/09.
//

import Foundation
import SwiftUI

extension View {
    
    func centerHorizontally() -> some View {
        HStack{
            Spacer()
            self
            Spacer()
        }
    }
    
    //ViewBuilder allows you to create a function or closure that returns multiple views without explicitly wrapping them in a container view, such as a 'VStack' or 'HStack'
    @ViewBuilder
    func visible(_ value: Bool) -> some View {
        switch value {
        case true: //if it is true return the view which is the text view.
            self
        case false: //If false return an empty text view.
            EmptyView()
        }
    }
    
}
