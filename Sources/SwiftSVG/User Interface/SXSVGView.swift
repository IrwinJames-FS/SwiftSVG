//
//  SXSVGView.swift
//  
//
//  Created by James Irwin on 11/12/22.
//

import SwiftUI

public struct SXSVGView : View {
    public var value: Int
    
    //This is just a test
    public init(_ value: Int) {
        self.value = value
    }
    public var body: some View {
        ZStack{
            Text("SVG VIEW")
        }
    }
}
