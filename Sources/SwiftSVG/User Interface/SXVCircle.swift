//
//  File.swift
//  
//
//  Created by James Irwin on 11/13/22.
//

import SwiftUI

public struct SXVCircle : View {
    var circle: SXCircle
    
    public init(_ circle: SXCircle) {
        self.circle = circle
    }
    
    public var body: some View {
        Path{p in
            p.addEllipse(in: circle.rect)
            p.fill(Color.red)
        }
    }
}
