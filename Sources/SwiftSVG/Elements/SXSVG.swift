//
//  SXSVG.swift
//  
//
//  Created by James Irwin on 11/12/22.
//

import Foundation

/**
 svg is the root element.
 
 
 */
//TODO: Unify common attributes into refined protocols
public struct SXSVG : SXViewPortElement {
    
    //MARK: - SXElement Atrributes
    public var tagname: SXTagName = .svg
    
    //MARK: - SXGroupElement Attributes
    public var children: [SXElement] = []
    
    //MARK: - SXViewPortElement Attributes
    public var viewBox: CGRect = CGRect(x: 0, y: 0, width: 1024, height: 1024)
    
}
