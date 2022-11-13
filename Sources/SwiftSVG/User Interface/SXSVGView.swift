//
//  SXSVGView.swift
//  
//
//  Created by James Irwin on 11/12/22.
//

import SwiftUI

public struct SXSVGView : View {
    public var element: SXSVG
    
    //This is just a test
    public init(_ element: SXSVG) {
        self.element = element
    }
    public var body: some View {
        ZStack{
            Text("SVG VIEW")
        }
    }
}
