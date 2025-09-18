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
//    let note: StudyNote
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("PLACEHOLDER: Note Title Goes Here!")
                    .font(.title)
                    .bold()
                
                Text("Original Notes")
                    .font(.headline)
                Text("PLACEHOLDER Actual Original Notes Here!")
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                
                Text("AI Summary")
                    .font(.headline)
                Text("PLACEHOLDER Actual Note Summary Goes Here")
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
    NoteDetailView()
}

