//
//  AddNoteView.swift
//  JotDownAssignmentStudent
//
//  Created by Vamsi Putti on 9/18/25.
//
import SwiftUI
import SwiftData
import UniformTypeIdentifiers
import PDFKit

struct AddNoteView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var courseName: String = ""
    @State private var noteText: String = ""
    @State private var summary: String = ""
    @State private var showImporter = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Course Name
                TextField("Course Name", text: $courseName)
                    .textFieldStyle(.roundedBorder)
                
                // Notes Input Area
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Notes")
                            .font(.headline)
                        Spacer()
                        Button("Upload File") {
                            showImporter = true
                        }
                        .buttonStyle(.bordered)
                    }
                    
                    Text("File successfully uploaded!")
                        .opacity(noteText.isEmpty ? 0.0 : 1.0)
                }
                
                // Generate Summary
                Button("Generate Summary") {
                    //TO DO: Use your NoteSummarizer.swift to use FoundationModels to get an
                    // AI Generated summary of your notes!
                    // HINT: The parsed text from the PDF is stored in the noteText variable after you upload a valid PDF!
                    // HINT: Store the AI Generated summary into the summary variable
                    
                }
                .buttonStyle(.borderedProminent)
            
                // AI Summary Output
                if !summary.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("AI Summary:")
                            .font(.headline)
                        Text(summary)
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                        
                        // Save Button
                        Button("Save Note") {
                            // TODO: Implement the functionality to save the newly added note to Swift Data
                            // HINT: Look at the context variable defined above! What is the purpose of that variable?
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(courseName.isEmpty ? true : false)
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("New Note")
        }
        // File Importer
        .fileImporter(
            isPresented: $showImporter,
            allowedContentTypes: [.plainText, .pdf],
            allowsMultipleSelection: false
        ) { result in
            handleFile(result: result)
        }
    }
    
    /// Handles the result of a file import operation (e.g., from a file picker).
    ///
    /// - Parameter result: A `Result` containing either a list of selected file URLs
    ///   or an error if the file import failed.
    ///
    /// This function:
    /// - Gets the first file URL from the result (if available).
    /// - Checks the file’s extension:
    ///   - If `.txt`, it reads the contents as plain text.
    ///   - If `.pdf`, it extracts the text using `extractText(from:)`.
    ///   - Otherwise, it sets the note text to `"Unsupported file type."`.
    ///
    /// The extracted or loaded text is stored in the `noteText` property.
    private func handleFile(result: Result<[URL], Error>) {
        guard let url = try? result.get().first else { return }
        
        if url.pathExtension == "txt" {
            if let content = try? String(contentsOf: url) {
                noteText = content
            }
        } else if url.pathExtension == "pdf" {
            noteText = extractText(from: url)
        } else {
            noteText = "Unsupported file type."
        }
    }
    
    /// Extracts text content from a PDF file at the given URL.
    ///
    /// - Parameter url: A `URL` pointing to a PDF file.
    /// - Returns: A `String` containing all text extracted from the PDF,
    ///   or an empty string if the file could not be read.
    ///
    /// This function:
    /// - Requests security-scoped access (required on iOS devices for file access).
    /// - Loads the PDF using `PDFDocument`.
    /// - Iterates through each page, collecting available text.
    /// - Returns the combined text of the entire document.
    ///
    /// If the PDF has pages with no text (e.g., scanned images),
    /// those pages will be skipped.
    private func extractText(from url: URL) -> String {
        var fullText = ""
        
        // Security-scoped access (needed on device!)
        if url.startAccessingSecurityScopedResource() {
            defer { url.stopAccessingSecurityScopedResource() }
            
            guard let pdfDoc = PDFDocument(url: url) else {
                return ""
            }
            
            for i in 0..<pdfDoc.pageCount {
                if let page = pdfDoc.page(at: i),
                   let text = page.string {
                    fullText += text + "\n"
                } else {
                    print("No text found on page \(i)")
                }
            }
        } else {
            print("Could not access file due to sandboxing")
        }
        return fullText
    }
}
#Preview {
    AddNoteView()
}

