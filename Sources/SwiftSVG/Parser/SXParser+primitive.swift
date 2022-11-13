//
//  SXParser+primitive.swift
//  
//
//  Created by James Irwin on 11/12/22.
//

import Foundation

extension SXParser {
    public func parseString<T>(_ str: String?, _ strategy: (String)->T?) -> T? {
        guard let s = str else {return nil}
        return strategy(s)
    }
    
    public func parseString<T>(_ str: String?, _ strategy: (String)->T?, _ d: T) -> T {
        guard let s = str else {return d}
        return stategy(s) ?? d
    }
    public func parseInt(_ str: String?) -> Int? {
        return parseString(str, Int.init)
    }
    
    public func parseInt(_ str: String?, _ d: Int) -> Int {
        return parseString(str, Int.init, d)
    }
}
