//
//  File.swift
//  
//
//  Created by James Irwin on 11/12/22.
//

import Foundation
import CoreGraphics

public class SXParser : NSObject, XMLParserDelegate {
    
    var element: SXElement?
    static public func parse(_ data: Data) {
        let p = XMLParser(data: data)
        let pd = SXParser()
        p.delegate = pd
        guard p.parse() else {
            print("Something went wrong")
            return
        }
        print("Parsed")
    }
    
    public func parserDidStartDocument(_ parser: XMLParser) {
        print("Started Parsing Document")
    }
    
    public func parserDidEndDocument(_ parser: XMLParser) {
        print("Finished Parsing Document")
    }
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        guard let tn = SXTagName(rawValue: elementName) else {
            print("Skipping unsupported tag")
            return
        }
        
        let elem: SXElement = parseElement(tn, attr: attributeDict)
        if element != nil {
            elem.parent = element
        }
        element = elem
    }
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        guard let tn = SXTagName(rawValue: elementName) else {
            print("Skipped unsupported tag")
            return
        }
        print("Finished Parsing Element", elementName)
    }
    
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
    public func parseList(_ str: String?) -> [String]? {
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
    
    public func parseDoubleList(_ str: String?, _ d: [Double]) -> [Double] {
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
        return String(str.replacingOccurrences(of: ",", with: " ").replacingOccurrences(of: "  ", with: " ")).split(separator: " ").map{String($0)}
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
        guard let list = parseDoubleList(str), list.count == 4 else {return nil}
        return CGRect(x: list[0], y: list[1], width: list[2], height: list[3])
    }
    
    //MARK: - Element Parsers
    public func parseElement(_ tagname: SXTagName, attr: [String: String]) -> SXElement {
        switch tagname {
        case .svg:
        }
    }
    
    public func parseSVG(attr: [String:String]) -> SXSVG {
        let viewBox = parseViewPortAttr(attr)
        
        return SXSVG(viewBox)
    }
    
    /** This method will search and return all of the properties supported in the viewport*/
    public func parseViewPortAttr(_ attr: [String:String]) -> CGRect {
        return parseBox(attr["viewBox"], CGRect(x: 0, y: 0, width: 1024, height: 1024))
    }
}
