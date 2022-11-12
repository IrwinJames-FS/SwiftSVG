//
//  SXCanvas.swift
//  
//
//  Created by James Irwin on 11/12/22.
//

import SwiftUI

public struct SXCanvas : View {
    public var number: Int
    
    public init(_ number: Int) {
        self.number = number
    }
    public var body: some View {
        ZStack{
            SXSVGView(number)
        }
    }
}
