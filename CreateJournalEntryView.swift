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
