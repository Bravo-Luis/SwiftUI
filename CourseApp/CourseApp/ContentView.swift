//
//  ContentView.swift
//  CourseApp
//
//  Created by Luis Bravo on 7/18/22.
//

import SwiftUI

struct ContentView: View {
    @State var adding = false
    @State var current = "clock.fill"
    @Namespace var animation
    
    @State var courseList = [course]()
    
    var body: some View {
        
        ZStack{
            
            VStack{
                if current == "clock.fill"{
                    TodayScreen(courseList: $courseList)
                    
                }
                else if current == "bonjour"{ wholeView(adding: $adding, courseList: $courseList)
                    
                }
                    
                    
                if !adding{
                    HStack{

                        Nav(current: $current, image: "clock.fill", animation: animation)
                        Nav(current: $current, image: "bonjour", animation: animation)
                        
                    }
                }
            }
        }
        .onAppear{
            courseList = fetchArray()
        }

    }
    
    
    func saveArray() {
        let allCourses = "COURSES"
        UserDefaults.standard.setStructArray(courseList, forKey: allCourses)
    }
    
    func fetchArray()-> [course]{
        let allCourses = "COURSES"
        let courses: [course] = UserDefaults.standard.structArrayData(course.self, forKey: allCourses)
        return (courses)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
