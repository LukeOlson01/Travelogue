//
//  EntryView.swift
//  Travelogue2
//
//  Created by Robert Olson on 12/4/23.
//

import SwiftUI

struct EntryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    @State var title: String = ""
    @State var content: String = ""
    @State var date: Date?
    var entry: Entry?
    var trip: Trip
    
    @State private var image = UIImage()
    @State private var showSheet = false
    
    init(trip: Trip) {
        self.trip = trip
    }
    
    init(trip: Trip, entry: Entry) {
        self.trip = trip
        self.entry = entry
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    HStack {
                        Text("Title").font(.system(size: 10))
                        Spacer()
                    }
                    TextField("Title", text: $title)
                }
                VStack {
                    Image(uiImage: self.image)
                        .resizable()
                        .frame(maxHeight: 2000)
                        .background(Color.black.opacity(0.2))
                        .aspectRatio(contentMode: .fill)
                    
                    Text("Change photo")
                        .foregroundColor(.blue)
                        .onTapGesture {
                            showSheet = true
                        }
                }
                .sheet(isPresented: $showSheet) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                }
                VStack {
                    HStack {
                        Text("Content").font(.system(size: 10))
                        Spacer()
                    }
                    TextEditor(text: $content)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 0.5))
                        .foregroundStyle(.primary)
                }
                if let date {
                    HStack(spacing: 2) {
                        Text("Last saved on").font(.system(size: 11.0))
                        Text(date, format: Date.FormatStyle(date: .numeric, time: .standard)).font(.system(size: 11.0))
                    }
                }
            }.padding()
                .onAppear {
                    guard let entry else { return }
                    title = entry.title
                    content = entry.content
                    date = entry.date
                    image = UIImage(data: entry.imageData) ?? UIImage()
                }
                .navigationTitle("Entry")
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: backButton, trailing: saveButtonA)
        }
    }
    
    var saveButtonA: some View {
        Button(action: {
            let imageData = image.jpegData(compressionQuality: 0.9) ?? Data()
            if let entry {
                entry.update(title: title, content: content, imageData: imageData)
            } else {
                trip.entries.append(Entry(title: title, content: content, imageData: imageData))
            }
            dismiss()
        }) {
            Text("Save")
        }
    }
    
    var saveButtonB: some View {
        Button(action: {
            let imageData = image.jpegData(compressionQuality: 0.9) ?? Data()
            if let entry {
                if (title != entry.title) {
                    trip.entries.append(Entry(title: title, content: content, imageData: imageData))
                } else {
                    entry.update(title: title, content: content, imageData: imageData)
                }
            } else {
                trip.entries.append(Entry(title: title, content: content, imageData: imageData))
            }
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
    EntryView(trip: Trip(title: "Title"), entry: Entry(title: "Title", content: "Content", imageData: Data()))
}
