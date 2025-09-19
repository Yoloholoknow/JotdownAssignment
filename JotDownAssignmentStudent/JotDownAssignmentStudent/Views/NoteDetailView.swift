//
//  NoteDetailView.swift
//  JotDownAssignmentStudent
//
//  Created by Vamsi Putti on 9/18/25.
//

import SwiftUI

// TO DO: Once you make your StudyNote model, make sure to change
// this file so the view dynamically shows the attributes of an
// individual StudyNote
struct NoteDetailView: View {
    let note: StudyNote
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(note.title)
                    .font(.title)
                    .bold()
                
                Text("Original Notes")
                    .font(.headline)
                Text(note.noteText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                
                Text("AI Summary")
                    .font(.headline)
                Text(note.summary)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle("Note Details")
    }
}

#Preview {
    NoteDetailView(note: StudyNote(title: "Sample Title", noteText: "This is the original text of the note.", summary: "This is the AI-generated summary."))
}
