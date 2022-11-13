//
//  SXGroupElement.swift
//  
//
//  Created by James Irwin on 11/12/22.
//

import Foundation

public protocol SXGroupElement : SXElement {
    var children : [SXElement] {get set}
}
