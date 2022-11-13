//
//  File.swift
//  
//
//  Created by James Irwin on 11/13/22.
//

import SwiftUI

public struct SXDirectorView : View {
    public var elem: SXElement
    
    public init(_ elem: SXElement) {
        self.elem = elem
    }
    public var body: some View {
        switch elem.tagname {
        case .svg: return AnyView(SXSVGView(elem as! SXSVG))
        case .circle: return AnyView(SXVCircle(elem as! SXCircle))
        }
    }
}
