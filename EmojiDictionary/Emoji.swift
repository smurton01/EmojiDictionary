//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Saya Murton on 9/5/17.
//  Copyright © 2017 Saya Murton. All rights reserved.
//

import Foundation

class Emoji: NSObject, NSCoding {
    var symbol: String
    var name: String
    var detailDescription: String
    var usage: String
    
    struct PropertyKey {
        static let symbol = "symbol"
        static let name = "name"
        static let detailDescription = "detailDescription"
        static let usage = "usage"
    }
    
    init(symbol: String, name: String, detailDescription: String, usage: String) {
    self.symbol = symbol
    self.name = name
    self.detailDescription = detailDescription
    self.usage = usage
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        
        guard let symbol = aDecoder.decodeObject(forKey: PropertyKey.symbol) as? String,
            let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String,
            let detailDescription = aDecoder.decodeObject(forKey: PropertyKey.detailDescription) as? String,
            let usage = aDecoder.decodeObject(forKey: PropertyKey.usage) as? String
            else {
                return nil
            }
        
        self.init(symbol: symbol, name: name, detailDescription: detailDescription, usage: usage)

    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(symbol, forKey: "symbol")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(detailDescription, forKey: "detailDescription")
        aCoder.encode(usage, forKey: "usage")
    }
    
}
