//
//  File.swift
//  
//
//  Created by James Irwin on 11/12/22.
//

import Foundation

public class SXParser : NSObject, XMLParserDelegate {
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
        print("Started Parsing Element", elementName)
    }
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        guard let tn = SXTagName(rawValue: elementName) else {
            print("Skipped unsupported tag")
            return
        }
        print("Finished Parsing Element", elementName)
    }
}
