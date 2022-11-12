//
//  SXViewPortElement.swift
//  
//
//  Created by James Irwin on 11/12/22.
//

import Foundation
import CoreGraphics

public protocol SXViewPortElement : SXGroupElement {
    var viewBox : CGRect {get set}
}
