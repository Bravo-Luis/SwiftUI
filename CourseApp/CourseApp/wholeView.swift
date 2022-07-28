//
//  wholeView.swift
//  CourseApp
//
//  Created by Luis Bravo on 7/19/22.
//

import SwiftUI

struct wholeView: View {
    
    @Binding var adding : Bool
    @Binding var courseList : [course]
    
    @State private var editMode = EditMode.inactive
    
    var body: some View {
        
            NavigationView{
                VStack{
                    if courseList.isEmpty {
                        Spacer()
                        Text("No Classes").font(.largeTitle).padding(.bottom,100)
                        Spacer()
                    }else{
                        
                        List{
                            ForEach(courseList){
                                course in
                                
                                listCourse(inputCourse: course)
                                
                            }
                            .onDelete(perform: removeRows)
                        }
                        
                    }
                }
                .toolbar{
                    
                    HStack(spacing: UIScreen.main.bounds.width - 100){
                        if !(courseList.isEmpty){VStack{EditButton()}}
                            
                            VStack {
                                NavigationLink("Add", destination: addScreen(adding: $adding, courseList: $courseList).onAppear{
                                    adding = true
                                }.onDisappear{adding = false}
                                )
                            }
                        
                    }
                }
                .environment(\.editMode, $editMode)
            }.onChange(of: courseList) { newValue in
                if editMode == .active && courseList.count == 0 {
                    editMode = .inactive
                }
            }
    }
    
    
    func saveArray() {
        let allCourses = "COURSES"
        UserDefaults.standard.setStructArray(courseList, forKey: allCourses)
    }
    
    func removeRows(at offsets: IndexSet) {
        courseList.remove(atOffsets: offsets)
        saveArray()
    }
}


