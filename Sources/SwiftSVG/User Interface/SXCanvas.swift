//
//  SXCanvas.swift
//  
//
//  Created by James Irwin on 11/12/22.
//

import SwiftUI

public struct SXCanvas : View {
    public var svg : SXSVG
    
    public init(_ svg: SXSVG) {
        self.svg = svg
    }
    
    public var body: some View {
        GeometryReader { geometry in
            SXSVGView(svg)
        }
        .frame(minWidth: 500, minHeight: 500)
    }
}
