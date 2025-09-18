//
//  NoteSummarizer.swift
//  JotDownAssignmentStudent
//
//  Created by Vamsi Putti on 9/18/25.
//

import Foundation

// TO DO: STUDENT
//
// In this file, you will implement a helper class called `NoteSummarizer`.
// The purpose of this class is to take a block of raw text (such as lecture notes
// or textbook excerpts) and use a language model to produce a short, clear summary.
//
// Requirements:
// 1. Use `LanguageModelSession` (from FoundationModels) to set up a session with instructions.
//    - The instructions should tell the model to act as an AI study assistant.
//    - The model should summarize notes into 3–5 concise bullet points.
// 2. Add a method (e.g., `summarizeNotes`) that takes in raw text (`String`) and
//    returns the summarized notes as a `String`.
// 3. The method should be asynchronous (`async throws`) because it calls the language model.
// 4. Inside that method, create a prompt that includes the user’s raw notes and
//    asks the model to generate the summary.
// 5. Return the model’s response to the caller so it can be displayed in the UI.
//
// Example of how this class will be used in the app:
// - A student uploads a `.txt` or `.pdf` file and the text is stored in `StudyNote.originalText`.
// - The app can then call `NoteSummarizer.summarizeNotes(originalText)` to generate
//   a short, exam-ready summary.
// - The summary is saved in the `StudyNote.summary` property.
//
// HINT: Look at the method signature `summarizeNotes(_:) async throws -> String`.
// Think about how to use `LanguageModelSession` to send a prompt and get a response.
//

class NoteSummarizer {
    func summarizeNotes(_ text: String) async throws -> String {
        return ""
    }
}
