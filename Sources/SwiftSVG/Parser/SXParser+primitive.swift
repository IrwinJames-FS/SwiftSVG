//
//  SXParser+primitive.swift
//  
//
//  Created by James Irwin on 11/12/22.
//

import Foundation
import CoreGraphics

extension SXParser {
    //MARK: Generic parse strategy
    public func parseString<T>(_ str: String?, _ strategy: (String)->T?) -> T? {
        guard let s = str else {return nil}
        return strategy(s)
    }
    
    //MARK: Specialized Primitive Methods
    public func parseInt(_ str: String?) -> Int? {
        return parseString(str, Int.init)
    }
    
    public func parseInt(_ str: String?, _ d: Int) -> Int {
        return parseString(str, Int.init) ?? d
    }
    
    public func parseFloat(_ str: String?) -> Float? {
        return parseString(str, Float.init)
    }
    
    public func parseFloat(_ str: String?, _ d: Float) -> Float {
        return parseString(str, Float.init) ?? d
    }
    
    public func parseDouble(_ str: String?) -> Double? {
        return parseString(str, Double.init)
    }
    
    public func parseDouble(_ str: String?, _ d: Double) -> Double {
        return parseString(str, Double.init) ?? d
    }
    
    //MARK: - List parsers
    public func parseList(_ str: String?) -> [String] {
        return parseString(str, splitToList(_:))
    }
    
    public func parseList(_ str: String?, _ d: [String]) -> [String] {
        return parseList(str) ?? d
    }
    
    public func parseIntList(_ str: String?) -> [Int]? {
        return parseString(str, intList(_:))
    }
    
    public func parseIntList(_ str: String?, _ d: [Int]) -> [Int] {
        return parseString(str, intList(_:)) ?? d
    }
    
    public func parseFloatList(_ str: String?) -> [Float]? {
        return parseString(str, floatList(_:))
    }
    
    public func parseFloatList(_ str: String?, _ d: [Float]) -> [Float] {
        return parseString(str, floatList(_:)) ?? d
    }
    
    public func parseDoubleList(_ str: String?) -> [Double]? {
        return parseString(str, doubleList(_:))
    }
    
    public func parseIntList(_ str: String?, _ d: [Double]) -> [Double] {
        return parseString(str, doubleList(_:)) ?? d
    }
    
    //MARK: - Special Parsers
    public func parseBox(_ str: String?) -> CGRect? {
        return parseString(str, toBox(_:))
    }
    
    public func parseBox(_ str: String?, _ d: CGRect) -> CGRect {
        return parseString(str, toBox(_:)) ?? d
    }
    
    //MARK: - Mutators
    
    public func splitToList(_ str: String) -> [String] {
        return str..replacingOccurrences(of: ",", with: " ").replacingOccurrences(of: "  ", with: " ").split(separator: " ")
    }
    
    public func intList(_ str: String) -> [Int] {
        return splitToList(str).map{Int($0) ?? 0}
    }
    
    public func floatList(_ str: String) -> [Float] {
        return splitToList(str).map{Float($0) ?? 0.0}
    }
    
    public func doubleList(_ str: String) -> [Double] {
        return splitToList(str).map{Double($0) ?? 0.0}
    }
    
    public func toBox(_ str: String) -> CGRect?{
        guard let list = doubleList(str), list.count == 4 else {return nil}
        return CGRect(x: list[0], y: list[1], width: list[2], height: list[3])
    }
}
