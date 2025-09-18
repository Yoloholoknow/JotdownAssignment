# JotDown Assignment (Fall 25)

<h4>For this assignment, you will tasked with implementing a simple app that takes in a PDF file of notes, generates an AI summary using Foundation Models, and saved these notes through
Swift Data.</h4>

To start, make sure that you are on Xcode 26 (as well as MacOS Tahoe) in order for Foundation Models to work properly!

You will be fully implementing the following files:
- `StudyNote.swift`
- `NoteSummarizer.swift`
- `AddNoteView.swift`
- `DashboardView.swift`
- `JotDownAssignmentFall25App.swift`

Note that you are not fully implementing all of these files. Most of the implementation has already been filled for some of the files; for these files, there might be a small aspect of functionality that needs to be implemented for everything to work correctly.

Let's go through what is expected of you in each file (more info can be found in each corresponding file): 
- `StudyNote.swift`
   - You will define a SwiftData model called `StudyNote`. The purpose of this model is to represent a study note that will be stored and retrieved in the app’s database.
- `NoteSummarizer.swift`
   - In this file, you will implement a helper class called `NoteSummarizer`. The purpose of this class is to take a PDF (such as lecture notes or textbook excerpts) and use a language model to produce a short, clear summary.
- `AddNoteView.swift`
   - Implement the functionality to save the newly added note to Swift Data. You DO NOT need to worry about implementing logic to inputting a PDF file and parsing the text from the file. That has already be done for you. Feel free to read the `handleFile` and `extractText` functions if you are curious! :)
- `NoteDetailView.swift`
   - Replace the placeholders with actual values of a StudyNote object in the view. Make sure to create an instance of a StudyNote object (it would theoretically get passed in from another View) and use the attributes of that instance in this View. Remember, this view shows the details of only ONE StudyNote object.
- `DashboardView.swift`
   - Obtain all of the saved notes from SwiftData, and display them in a simple view so users can revisit their saved notes. Consider using seperate buttons in a list (hint: NavigationLink) that leads to the NoteDetailView so users can see all of the data related to their notes. Be creative!
- `JotDownAssignmentFall25App.swift`
   - Add the appropriate SwifData modifier onto WindowGroup so the app knows how to store and manage StudyNote objects with SwiftData. (HINT: This is ONE line)
  
 
