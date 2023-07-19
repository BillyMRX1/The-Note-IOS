//
//  NoItemView.swift
//  The Notes
//
//  Created by Brilian Ade Putra on 19/07/23.
//

import SwiftUI

struct NoItemView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Empty Notes")
                    .font(.title)
                    .fontWeight(.semibold)
                NavigationLink(
                    destination: AddNoteView(),
                    label: {
                        Text("New Notes 📝")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                        
                    }
                )
                .padding(.top, 16)
                .padding(.horizontal, 50)
                .shadow(
                    color: Color.accentColor.opacity(0.7),
                    radius: 10,
                    x: 0,
                    y: 30
                )
                .scaleEffect(1.0)
                .offset(y: 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemView()
                .navigationTitle("Title")
        }
    }
}
