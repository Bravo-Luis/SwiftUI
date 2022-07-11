//
//  ContentView.swift
//  Listy
//
//  Created by Luis Bravo on 7/6/22.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITableView.appearance().separatorStyle = .singleLine
       UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
    }
     
    @State var addTitle : String = ""
    @State var addNote : String = ""
    @State var addNoteList : [Note] = []
    @State var mainBlur : CoreGraphics.CGFloat = 0.0
    
    @State var width = UIScreen.main.bounds.width - 40
    @State var boxList : [Box] = []
    @State var addMode = false
    
    
    var body: some View {
        
    ZStack{
        
        
        
        VStack{

            Spacer(minLength: 0)
            
            NavigationView{
                List{
                    Spacer(minLength: 50)
                    
                        ForEach(boxList){
                                box in
                            VStack{
                                contentBox(input: box)
                            }
                            .frame(minHeight: 0)
                                
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                    .listRowSeparator(.hidden)
                        
                }
                .listStyle(.inset)
                .environment(\.defaultMinListRowHeight,0)
                .navigationBarHidden(true)
                .background(Color(.clear))
                /*
                .overlay{
                    
                    if ((addMode == false) && !(boxList.isEmpty)) {
                        VStack{
                            Spacer(minLength: 0)
                            HStack{
                                
                                
                                EditButton()
                                    .padding(20)
                                    
                                    .background(Color(.systemMint))
                                    .clipShape(Capsule())
                                    .foregroundColor(Color(.white))
                                    .opacity(0.7)
                                
                                Spacer(minLength: 0)
                                
                            }
                            .padding()
                            
                        }.padding(10)
                    }
                            
                    
                }
                .listStyle(.inset)
                .environment(\.defaultMinListRowHeight,10)
                .navigationBarHidden(true)
                .background(Color(.clear))
            */
            }
            
        }
        .background((Color(.systemGray5)))
        .blur(radius: mainBlur)
        .onAppear{
            boxList = fetchArray()
        }
        
        VStack{
            Spacer(minLength: 0)
            
            
                
                if addMode == false {
                    HStack{
                        
                        Spacer(minLength: 0)
                        Button("+"){
                            
                            AddButtonClicked()
                            
                        }
                        .padding(25)
                        .font(.title)
                        .background(Color(.systemGreen))
                        .clipShape(Circle())
                        .foregroundColor(Color(.white))
                        .opacity(0.7)
                        
                        
                    }
                    .padding()
                
            }
            
        }
        
        if ((addMode == false) && (boxList.isEmpty)) {
            VStack{
                Text("No Notes to Display")
                Text("Add some by pressing the '+' ")
            }
            .opacity(0.3)
        }
        
        if addMode == true {
            withAnimation{
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(.systemGray5))
                    
                    VStack{
                        HStack{
                            Text("Title: ")
                                .font(.title2)
                            
                            TextField("Enter Title", text: $addTitle )
                                .font(.title2)
                        }
                        Rectangle()
                            .opacity(0.2)
                            .frame(width: width - 10, height: 1, alignment: .center)
                        HStack{
                            Text("Note: ")
                            
                            TextField("Enter Note", text: $addNote)
                            Button("+"){
                                PlusClicked()
                            }
                                .buttonStyle(.borderedProminent)
                        }
                        
                        List{
                            ForEach(addNoteList.reversed()){note in
                                Text(note.text)
                            }
                        }
                        HStack{
                            Button("Cancel", role: .destructive){
                                cancelButtonClicked()
                            }
                            .buttonStyle(.borderedProminent)
                            Button("Undo"){
                                UndoButtonClicked()
                            }
                            .buttonStyle(.bordered)
                            Spacer(minLength: 0)
                            Button("Save"){
                                SaveButtonClicked()
                            }.buttonStyle(.borderedProminent)
                        }.padding(.vertical)
                        
                    }
                    .padding()
                }.frame(minWidth: width, idealWidth: width, maxWidth: width, minHeight: 100, idealHeight: 200, maxHeight: 400, alignment: .center)
            }
                
        }
        
    }
        
    }
    
    func delete(at offsets: IndexSet){
        boxList.remove(atOffsets: offsets)
        saveArray()
    }
    
    func move(from source: IndexSet, to destination: Int) {
        boxList.move(fromOffsets: source, toOffset: destination)
    }
    
    func AddButtonClicked(){
        mainBlur = 10.0
        
        withAnimation{
            addMode = true
        }
    }
    
    func SaveButtonClicked(){
        if validString(var: addTitle){
            if !(addNoteList.isEmpty){
                boxList.append(Box(title: addTitle, NoteList: addNoteList))
                
                addMode = false
                
                addTitle.removeAll()
                addNoteList.removeAll()
                addNote.removeAll()
                
                saveArray()
               
                    
                mainBlur = 0
                    
            }
        }
    }
    
    func UndoButtonClicked(){
        if !(addNoteList.isEmpty){
        addNoteList.removeLast()
        }
    }
    
    func PlusClicked(){
        if validString(var: addNote){
            addNoteList.append(Note(text: addNote))
            addNote.removeAll()
        }
    }
    
    func validString(var str : String) -> Bool {
        
        if str.isEmpty {
            return false
        }
        
        for i in str {
            if (i != " ") {
                return true
            }
        }
    return false
    }
    
    func cancelButtonClicked(){
        addNote.removeAll()
        addTitle.removeAll()
        addNoteList.removeAll()
        addMode = false
        mainBlur = 0.0
    }
    
    func saveArray() {
        let allNotes = "NOTES"
        UserDefaults.standard.setStructArray(boxList, forKey: allNotes)
    }
    
    func fetchArray()-> [Box]{
        let allNotes = "NOTES"
        let notes: [Box] = UserDefaults.standard.structArrayData(Box.self, forKey: allNotes)
        return (notes)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



