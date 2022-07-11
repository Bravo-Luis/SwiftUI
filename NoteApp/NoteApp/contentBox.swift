//
//  contentBox.swift
//  Listy
//
//  Created by Luis Bravo on 7/6/22.
//

import SwiftUI

struct contentBox: View {
    
    var input : Box
    
    @State var width = UIScreen.main.bounds.width - 10
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemGray6))
            
            VStack{
                HStack{
                    Text(input.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom,5)
                    Spacer(minLength: 0)
                }
                
               // Rectangle()
                    //.frame(width: width - 10, height: 1, alignment: .center)
                    //.opacity(0.2)
                
                ForEach(input.NoteList) {
                    note in
                
                    HStack{
                        Text(note.text)
                        Spacer(minLength: 0)
                    }
                    
                }
            }
            .padding(.bottom, 10)
            
            .padding()

            
        }
        .frame(minWidth: width, idealWidth: width, maxWidth: width, minHeight: nil, idealHeight: nil, maxHeight: nil, alignment: .center)
        
    }
}

struct contentBox_Previews: PreviewProvider {
    static var previews: some View {
        contentBox(input: Box(title: "Title", NoteList: [Note(text: "Note"),Note(text: "Note")]))
    }
}
