//
//  DashboardView.swift
//  JotDownAssignmentStudent
//
//  Created by Vamsi Putti on 9/18/25.
//

import SwiftUI
import SwiftData

struct DashboardView: View {
    //TO DO: Obtain all of the saved notes from SwiftData, and display them in a simple view so users can revisit their saved notes. Consider using seperate buttons in a list (hint: NavigationLink) that leads to the NoteDetailView so users can see all of the data related to their notes. Be creative!
    
    @Query private var notes: [StudyNote]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        // Your implementation that is able to show all of the user's notes go here.
        NavigationStack {
            List {
                ForEach(notes) { note in
                    NavigationLink(destination: NoteDetailView(note: note)) {
                        VStack {
                            Text(note.title)
                                .font(.headline)
                            Text(note.summary)
                                .font(.subheadline)
                                .lineLimit(2)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Study Dashboard")
            .toolbar {
                NavigationLink(destination: AddNoteView()) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    DashboardView()
}
