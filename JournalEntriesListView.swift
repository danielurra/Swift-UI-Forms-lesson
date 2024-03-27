//
//  ContentView.swift
//  JournalEntries
//
//  Created by Eusebio Taba on 3/20/24.
//

import SwiftUI

struct JournalEntriesListView: View {

        
    var body: some View {
        NavigationStack {
            List (plural){ iterateArrayMembers in
                NavigationLink(destination: JournalEntryDDetailView(detailJournalEntry: iterateArrayMembers)){
                    RowDetailView(rowJournalEntry: iterateArrayMembers)
                }
            }
            .navigationTitle("\(plural.count) Journal Entries")
        }
    }
}

#Preview {
    JournalEntriesListView()
}
