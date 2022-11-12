//
//  SXViewPortElement.swift
//  
//
//  Created by James Irwin on 11/12/22.
//

import Foundation
import CoreGraphics

public protocol SXViewPortElement : SXGroupElement {
    public var viewBox : CGRect {get set}
}
