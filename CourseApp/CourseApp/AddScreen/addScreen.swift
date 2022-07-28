//
//  addScreen.swift
//  CourseApp
//
//  Created by Luis Bravo on 7/18/22.
//

import SwiftUI
import Combine

struct addScreen: View {
    @Binding var adding : Bool
    @Binding var courseList : [course]
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var ChosenColor : String = "courseGray"
    @State var startTime = Date()
    @State var endTime = Date()
    
    @State private var newCourseTitle : String = ""
    @State private var newCourseLocation : String = ""
    @State private var newCourseTime : String = ""
    @State private var newCourseInstructor : String = ""
    @State private var newCourseDays : String = ""
    
    @State private var monday : Bool = false
    @State private var tuesday : Bool = false
    @State private var wednesday : Bool = false
    @State private var thursday : Bool = false
    @State private var friday : Bool = false
    
    @State private var error : Bool = false

    var body: some View {
        
        VStack{
            HStack{
                Text("Add a Course")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            HStack{
                TextField("Course Title", text:$newCourseTitle)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)

            }
            .padding(.horizontal)
            HStack{
                TextField("Course Instructor", text:$newCourseInstructor)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)

            }
            .padding(.horizontal)
            HStack{
                TextField("Course Location", text:$newCourseLocation)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.bottom,20)
            .padding(.horizontal)
            HStack(spacing:30){
                boolButton(day: $monday, show: "M")
                boolButton(day: $tuesday, show: "T")
                boolButton(day: $wednesday, show: "W")
                boolButton(day: $thursday, show: "R")
                boolButton(day: $friday, show: "F")
            }
            .frame(width: UIScreen.main.bounds.width, height: 50, alignment: .center)
            .padding(.bottom)
            timeScroller(startTime: $startTime, endTime: $endTime)
            colorList(ChosenColor: $ChosenColor)

            Spacer(minLength: 0)
            
            Button("Save"){
                
                if whatError() == "No error" {
                    daysToString()
                    timesToString()
                    var newCourse = course(courseName: newCourseTitle, days: newCourseDays, times: newCourseTime, location: newCourseLocation, instructor: newCourseInstructor, color: ChosenColor)
                    courseList.append(newCourse)
                    saveArray()
                    adding = false
                    self.presentationMode.wrappedValue.dismiss()
                }else{
                    error = true
                }
                
            }
            .foregroundColor(Color(.white))
            .cornerRadius(10)
            .buttonStyle(.borderedProminent)
            .padding()
            .alert(whatError(), isPresented: $error) {
                Button("OK", role: .cancel) {}
            }
        }
        .foregroundColor(Color("TextColor"))
        .background(Color(ChosenColor))
        .onAppear{
            courseList = fetchArray()
        }
        
    }
    
    func timesToString(){
        var sTime = startTime.formatted(date: .omitted, time: .shortened)
        sTime.removeLast(2)
        newCourseTime = sTime + "- " + endTime.formatted(date: .omitted, time: .shortened)
    }
    
    func daysToString() {
        if monday {
            newCourseDays.append("M")
        }
        if tuesday {
            newCourseDays.append("T")
        }
        if wednesday {
            newCourseDays.append("W")
        }
        if thursday {
            newCourseDays.append("R")
        }
        if friday {
            newCourseDays.append("F")
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
    
    func whatError()->String{
        
        if newCourseTitle == "" {return "No Course Title"}
        if newCourseInstructor == "" {return "No Instructor"}
        if newCourseLocation == "" {return "No Location"}
        if !monday && !tuesday && !wednesday && !thursday && !friday {return "No Days"}
        if startTime == endTime {return "Start time = End time"}
        
        return "No error"
    }
    
}

