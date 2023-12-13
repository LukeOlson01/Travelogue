//
//  Entry.swift
//  Travelogue2
//
//  Created by Robert Olson on 12/4/23.
//

import Foundation
import SwiftData

@Model
final class Entry{
    var title: String
    var date: Date
    var content: String
    var imageData: Data
    
    init(title: String, content: String, imageData: Data){
        self.title = title
        self.date = Date.now
        self.content = content
        self.imageData = imageData
    }
    
    func update(title: String, content: String, imageData: Data){
        self.title = title
        self.date = Date.now
        self.content = content
        self.imageData = imageData
    }
}
