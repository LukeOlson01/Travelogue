//
//  ContentView.swift
//  Travelogue3
//
//  Created by Robert Olson on 12/5/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var trips: [Trip]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(trips) { trip in
                    NavigationLink {
                        TripView(trip: trip)
                    } label: {
                        TripCellView(trip: trip)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Trips")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    NavigationLink {
                        AddTripView()
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
                modelContext.delete(trips[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Trip.self, inMemory: true)
}
