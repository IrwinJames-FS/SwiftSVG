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
        p.delegate = SXParser()
        guard p.parse() else {
            print("Something went wrong")
            return
        }
        print("Parsed")
    }
}
