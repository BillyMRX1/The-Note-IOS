//
//  The_NotesApp.swift
//  The Notes
//
//  Created by Brilian Ade Putra on 19/07/23.
//

import SwiftUI

@main
struct The_NotesApp: App {
    
    @StateObject var noteViewModel: NoteViewModel = NoteViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                NoteListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(noteViewModel)
        }
    }
}
