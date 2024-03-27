# SwiftUI Forms lesson
![forms](https://github.com/danielurra/Swift-UI-Forms-lesson/assets/51704179/4279a60e-bb90-4d51-aeb1-3cb27259e411)

## Grab the code - Journal Entry List View
```swift
//
//  ContentView.swift
//  JournalEntries
//
//  Created by Eusebio Taba on 3/20/24.
//

import SwiftUI
import SwiftData

struct JournalEntriesListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var arrayPlural: [jedi]
    
    @State var showCreateView = false
    
    var body: some View {
        NavigationStack {
            List (arrayPlural){ iterateArrayMembers in
                NavigationLink(destination: JournalEntryDDetailView(detailJournalEntry: iterateArrayMembers)){
                    RowDetailView(rowJournalEntry: iterateArrayMembers)
                }
            }
            .navigationTitle("\(arrayPlural.count) Journal Entries")
            .toolbar {
                Button(action: {
                    showCreateView = true
                }) {
                    Label("Add Item", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showCreateView){
                CreateJournalEntryView()
            }
        }
    }
}

#Preview {
    JournalEntriesListView()
        .modelContainer(for: jedi.self, inMemory: true)
}
	

```
## Grab the code - Cretae Journal Entry View
```swift
//
//  CreateJournalEntryView.swift
//  JournalEntries
//
//  Created by Eusebio Taba on 3/27/24.
//

import SwiftUI

struct CreateJournalEntryView: View {
    
    @State var title: String = ""
    @State var depunoyletra: String = "Borrar y escribir"
    @State var rating: Double = 3.0
    @State var timestamp: Date = Date()
    

    var body: some View {
        Form {
            TextField("Title", text: $title)
            
            DatePicker("Date", selection: $timestamp, displayedComponents: .date)
            
            Text(String(repeating: "⭐️", count: Int(rating)))
            Slider(value: $rating, in: 1...5, step: 1)
            
            TextEditor(text: $depunoyletra)
        }
    }
}

#Preview {
    CreateJournalEntryView()
}

```
