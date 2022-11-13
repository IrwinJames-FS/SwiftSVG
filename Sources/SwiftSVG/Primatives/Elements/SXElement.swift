//
//  SXElement.swift
//  
//
//  Created by James Irwin on 11/12/22.
//

import Foundation


public protocol SXElement {
    var tagname: SXTagName {get}
    var parent: SXGroupElement? {get set}
}
