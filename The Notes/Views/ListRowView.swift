//
//  ListRowView.swift
//  The Notes
//
//  Created by Brilian Ade Putra on 19/07/23.
//

import SwiftUI

struct ListRowView: View {
    
    let note: NoteModel
    
    var body: some View {
        VStack {
            HStack {
                Text(note.title)
                Spacer()
            }
            .font(.title2)
            .padding(.top, 8)
            .padding(.bottom, 4)
            HStack {
                Text(note.content)
                    .lineLimit(3)
                Spacer()
            }
            .font(.body)
            .padding(.bottom, 8)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var note = NoteModel(title: "title", content: "content text")
    
    static var previews: some View {
        Group {
            ListRowView(note: note)
        }
        .previewLayout(.sizeThatFits)
    }
}
