//
//  NoteModel.swift
//  The Notes
//
//  Created by Brilian Ade Putra on 19/07/23.
//

import Foundation

struct NoteModel: Identifiable, Codable, Hashable {
    let id: String
    let title: String
    let content: String
    
    init(id: String = UUID().uuidString, title: String, content: String) {
        self.id = id
        self.title = title
        self.content = content
    }
}
