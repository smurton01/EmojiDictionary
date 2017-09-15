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
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("emojis")
    
    init(symbol: String, name: String, detailDescription: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.detailDescription = detailDescription
        self.usage = usage
    }
    
    static func loadFromFile() -> [Emoji]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Emoji.ArchiveURL.path) as? [Emoji]
    }
    
    static func loadSampleEmojis() -> [Emoji] {
        return [
            Emoji(symbol: "😀", name: "Grinning Face", detailDescription: "A typical smiley face.", usage: "happiness"),
            Emoji(symbol: "😕", name: "Confused Face", detailDescription: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
            Emoji(symbol: "😍", name: "Heart Eyes", detailDescription: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
            Emoji(symbol: "👮", name: "Police Officer", detailDescription: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority"),
            Emoji(symbol: "🐢", name: "Turtle", detailDescription: "A cute turtle.", usage: "Something slow"),
            Emoji(symbol: "🐘", name: "Elephant", detailDescription: "A gray elephant.", usage: "good memory"),
            Emoji(symbol: "🍝", name: "Spaghetti", detailDescription: "A plate of spaghetti.", usage: "spaghetti"),
            Emoji(symbol: "🎲", name: "Die", detailDescription: "A single die.", usage: "taking a risk, chance; game"),
            Emoji(symbol: "⛺️", name: "Tent", detailDescription: "A small tent.", usage: "camping"),
            Emoji(symbol: "📚", name: "Stack of Books", detailDescription: "Three colored books stacked on each other.", usage: "homework, studying"),
            Emoji(symbol: "💔", name: "Broken Heart", detailDescription: "A red, broken heart.", usage: "extreme sadness"),
            Emoji(symbol: "💤", name: "Snore", detailDescription: "Three blue \'z\'s.", usage: "tired, sleepiness"),
            Emoji(symbol: "🏁", name: "Checkered Flag", detailDescription: "A black-and-white checkered flag.", usage: "completion")]
    }
    
    static func saveToFile(emojis: [Emoji]) {
        NSKeyedArchiver.archiveRootObject(emojis, toFile: Emoji.ArchiveURL.path)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
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
        aCoder.encode(symbol, forKey: PropertyKey.symbol)
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(detailDescription, forKey: PropertyKey.detailDescription)
        aCoder.encode(usage, forKey: PropertyKey.usage)
    }
    
}
