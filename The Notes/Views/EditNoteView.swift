//
//  EditNoteView.swift
//  The Notes
//
//  Created by Brilian Ade Putra on 19/07/23.
//

import SwiftUI

struct EditNoteView: View {
    
    let note: NoteModel
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var noteViewModel: NoteViewModel
    @State var titleTextField: String = ""
    @State var contentTextField: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    init(note: NoteModel) {
        self.note = note
        _titleTextField = State(initialValue: note.title)
        _contentTextField = State(initialValue: note.content)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Title", text: $titleTextField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                TextField("Type something here...", text: $contentTextField, axis: .vertical)
                    .padding(.horizontal)
                    .frame(minHeight: 55, maxHeight: .infinity)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .multilineTextAlignment(.leading)
            }
            .padding(14)
        }
        .navigationTitle("Edit Note 🖋️")
        .alert(isPresented: $showAlert, content: getAlert)
        .navigationBarItems(trailing: Text("Save".uppercased())
            .foregroundColor(.accentColor)
            .font(.headline)
            .onTapGesture {
                saveButtonPressed()
            }
        )
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            noteViewModel.updateNote(noteToUpdate: NoteModel(id: note.id, title: titleTextField, content: contentTextField))
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if titleTextField.count < 3 {
            alertTitle = "Your title must be at least 3 characters long"
            showAlert.toggle()
            return false
        } else if contentTextField.count < 3 {
            alertTitle = "Your notes must be at least 3 characters long"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct EditNoteView_Previews: PreviewProvider {
    
    static var note = NoteModel(title: "title", content: "content text")
    
    static var previews: some View {
        Group {
            NavigationView {
                EditNoteView(note: note)
            }
            .preferredColorScheme(.light)
            .environmentObject(NoteViewModel())
            NavigationView {
                EditNoteView(note: note)
            }
            .preferredColorScheme(.dark)
            .environmentObject(NoteViewModel())
        }
    }
}
