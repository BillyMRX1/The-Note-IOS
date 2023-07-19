//
//  NoteViewModel.swift
//  The Notes
//
//  Created by Brilian Ade Putra on 19/07/23.
//

import Foundation

class NoteViewModel: ObservableObject {
    @Published var noteList: [NoteModel] = [] {
        didSet {
            saveNotes()
        }
    }
    
    let notesKey: String = "note_list"
    
    init() {
        getNotes()
    }
    
    func getNotes() {
        guard
            let data = UserDefaults.standard.data(forKey: notesKey),
            let savedNotes = try? JSONDecoder().decode([NoteModel].self, from: data)
        else { return }
        
        self.noteList = savedNotes
    }
    
    func deleteNote(indexSet: IndexSet) {
        noteList.remove(atOffsets: indexSet)
    }
    
    func moveNote(from: IndexSet, to: Int) {
        noteList.move(fromOffsets: from, toOffset: to)
    }
    
    func addNote(title: String, content: String) {
        let newItem = NoteModel(title: title, content: content)
        noteList.append(newItem)
    }
    
    func updateNote(noteToUpdate: NoteModel){
        if let index = noteList.firstIndex(where: { $0.id == noteToUpdate.id }) {
            noteList[index] = noteToUpdate
        }
    }
  
    func saveNotes() {
        if let encodedData = try? JSONEncoder().encode(noteList) {
            UserDefaults.standard.set(encodedData, forKey: notesKey)
        }
    }
}
