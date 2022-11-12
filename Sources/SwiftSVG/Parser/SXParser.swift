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
    
    func parserDidStartDocument(_ parser: XMLParser) {
        print("Started Parsing Document")
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        print("Finished Parsing Document")
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        print("Started Parsing Element", elementName)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("Finished Parsing Element", elementName)
    }
}
