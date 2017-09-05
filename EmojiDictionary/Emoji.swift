//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Saya Murton on 9/5/17.
//  Copyright © 2017 Saya Murton. All rights reserved.
//

import Foundation

class Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init(symbol: String, name: String, description: String, usage: String) {
    self.symbol = symbol
    self.name = name
    self.description = description
    self.usage = usage
    }
}
