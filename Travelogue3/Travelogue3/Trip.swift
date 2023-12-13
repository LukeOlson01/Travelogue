//
//  Trip.swift
//  Travelogue3
//
//  Created by Robert Olson on 12/5/23.
//

import Foundation
import SwiftData

@Model
final class Trip{
    var title: String
    var entries: [Entry]
    
    init(title: String){
        self.title = title
        self.entries = []
    }
}
