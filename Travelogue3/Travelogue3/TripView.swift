//
//  TripView.swift
//  Travelogue2
//
//  Created by Robert Olson on 12/4/23.
//

import SwiftUI
import SwiftData

struct TripView: View {
    @Environment(\.modelContext) private var modelContext
    //@Query private var entries: [Entry]
    var trip: Trip?
    
    init(){
    }
    
    init(trip: Trip){
        self.trip = trip
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(trip!.entries) { entry in
                    NavigationLink {
                        EntryView(trip: trip!, entry: entry)
                    } label: {
                        EntryCellView(entry: entry)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle(trip!.title)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    NavigationLink {
                        EntryView(trip: trip!)
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                trip!.entries.remove(at: index)
            }
        }
    }
}

/*#Preview {
    TripView(trip: Trip(title: "Title"))
}*/
