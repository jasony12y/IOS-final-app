//
//  Food.swift
//  Seafood
//
//  Created by Yotta on 2018/1/7.
//  Copyright © 2018年 Yotta. All rights reserved.
//

import Foundation
import UIKit

struct note: Codable {
    var name: String
    var date: String
    var innerBeauty: Bool
    //var imageName: String?
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static func saveToFile(foods: [note]) {
        let propertyEncoder = PropertyListEncoder()
        if let data = try? propertyEncoder.encode(foods) {
            let url = note.documentsDirectory.appendingPathComponent("note")
            try? data.write(to: url)
        }
    }
    
    static func readFoodsFromFile() -> [note]? {
        let propertyDecoder = PropertyListDecoder()
        let url = note.documentsDirectory.appendingPathComponent("note")
        if let data = try? Data(contentsOf: url), let foods = try? propertyDecoder.decode([note].self, from: data) {
            return foods
        } else {
            return nil
        }
    }
    
    
    
}


