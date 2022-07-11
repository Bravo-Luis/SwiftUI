//
//  ContentBox.swift
//  NoteApp
//
//  Created by Luis Bravo on 7/4/22.
//

import SwiftUI

struct ContentBox: View {
    
    mutating func removeRow(at offsets: IndexSet) {
        dayInput.noteList.remove(atOffsets: offsets)
    }
    
    var dayInput : day
    
    @State var AdjustedScreenWidth = UIScreen.main.bounds.width - 30
    
    var body: some View {
        
        VStack{
            
            ZStack{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.gray)
                    .frame(minWidth: AdjustedScreenWidth, idealWidth: AdjustedScreenWidth, maxWidth: AdjustedScreenWidth, minHeight: 100, idealHeight: 100, maxHeight: 300)
                
                VStack{
                    Spacer(minLength: 5)
                    HStack{
                        Text(dayInput.dayName)
                            .fontWeight(.heavy)
                            .font(.title)
                            .padding(.leading)
                        Spacer(minLength: 0)
                    }
                    Spacer(minLength: 0)
                    
                    ForEach(dayInput.noteList) {
                        note in
                        
                        HStack{
                            Text(note.name)
                            Spacer()
                            Text(note.info)
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        
                        
                    }
                    Spacer(minLength: 15)
                    
                }
                
            }
        
            
        }
        .frame(width: AdjustedScreenWidth)
        
        
    }
}

struct ContentBox_Previews: PreviewProvider {
    static var previews: some View {
        ContentBox(dayInput : day(dayName: "dayName", noteList: [note(name: "name", info: "info"),note(name: "name", info: "info"),note(name: "name", info: "info")]))
    }
}


struct day:Identifiable {
    let id = UUID()
    var dayName : String
    var noteList : [note]
}

struct note:Identifiable {
    let id = UUID()
    var name : String
    var info : String
    
}

