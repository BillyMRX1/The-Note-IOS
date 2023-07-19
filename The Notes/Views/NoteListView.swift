//
//  NoteListView.swift
//  The Notes
//
//  Created by Brilian Ade Putra on 19/07/23.
//

import SwiftUI

struct NoteListView: View {
    
    @EnvironmentObject var noteViewModel: NoteViewModel
    
    @State private var selectedNote: NoteModel?
    
    var body: some View {
        ZStack {
            if noteViewModel.noteList.isEmpty {
                NoItemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(noteViewModel.noteList) { note in
                        NavigationLink(destination: EditNoteView(note: note), tag: note, selection: $selectedNote) {
                            ListRowView(note: note)
                        }
                        .onTapGesture {
                            withAnimation(.linear) {
                                selectedNote = note
                            }
                        }
                    }
                    .onDelete(perform: noteViewModel.deleteNote)
                    .onMove(perform: noteViewModel.moveNote)
                }
            }
        }
        .navigationTitle("The Note")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddNoteView())
        )
    }
}

struct NoteListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoteListView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(NoteViewModel())
    }
}
