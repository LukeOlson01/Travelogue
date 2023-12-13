//
//  TripCellView.swift
//  Travelogue2
//
//  Created by Robert Olson on 12/5/23.
//

import SwiftUI

struct TripCellView: View {
    var trip: Trip
    init(trip: Trip) {
        self.trip = trip
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(trip.title)
                Spacer()
            }
        }
    }
}

#Preview {
    TripCellView(trip: Trip(title: "Title"))
}
