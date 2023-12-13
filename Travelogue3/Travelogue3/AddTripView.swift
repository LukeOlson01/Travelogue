//
//  AddTripView.swift
//  Travelogue2
//
//  Created by Robert Olson on 12/5/23.
//

import SwiftUI

struct AddTripView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    @State var title: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter name here", text: $title)
                Spacer()
            }.padding()
            .navigationTitle("Add Trip")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton, trailing: saveButton)
        }
    }
    
    var saveButton: some View {
        Button(action: {
            modelContext.insert(Trip(title: title))
            dismiss()
        }) {
            Text("Save")
        }
    }
    
    var backButton: some View {
        Button(action: {
            dismiss()
        }) {
            Text("Cancel")
        }
    }
}


#Preview {
    AddTripView()
}
