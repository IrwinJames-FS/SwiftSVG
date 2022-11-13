//
//  File.swift
//  
//
//  Created by James Irwin on 11/13/22.
//

import Foundation
import CoreGraphics

public struct SXCircle : SXElement {
    //MARK: - Element Properties
    public var tagname: SXTagName = .circle
    
    //MARK: - Shape Properties
    public var cx: Double
    public var cy: Double
    public var r: Double
    
    
    //MARK: - Computed properties
    var rect: CGRect {
        let d = r * 2
        return CGRect(x: cx, y: cy, width: d, height: d)
    }
    
}
