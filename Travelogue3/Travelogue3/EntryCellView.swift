//
//  EntryCellView.swift
//  Travelogue2
//
//  Created by Robert Olson on 12/4/23.
//

import SwiftUI

struct EntryCellView: View {
    var entry: Entry
    init(entry: Entry) {
        self.entry = entry
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(entry.title)
                Spacer()
            }
            HStack {
                Text(entry.date, format: Date.FormatStyle(date: .numeric, time: .standard)).font(.system(size: 11.0))
                Spacer()
            }
        }
    }
}

#Preview {
    EntryCellView(entry: Entry(title: "Title", content: "Content", imageData: Data()))
}
