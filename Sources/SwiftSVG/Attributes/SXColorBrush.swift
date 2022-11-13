//
//  SXColorBrush.swift
//  
//
//  Created by James Irwin on 11/13/22.
//

import Foundation

public struct SXColorBrush {
    public var value: Int
    
    public init(_ value: Int = 0) {
        self.value = value
    }
    
    //MARK: - Computed Properties
    public var red: Int {
        return (value >> 16) & 0xff
    }
    
    public var green: Int {
        return (value >> 8) & 0xff
    }
    
    public var blue: Int {
        return value & 0xff
    }
    
    public var transparency : Int {
        return (value >> 24) & 0xff
    }
    
    public var alpha : Int {
        return 0xff - transparency
    }
    
    public static func == (lhs: SXColorBrush, rhs: SXColorBrush) -> Bool {
        return lhs.value == rhs.value
    }
}
