//
//  TodayScreen.swift
//  CourseApp
//
//  Created by Luis Bravo on 7/18/22.
//

import SwiftUI

struct TodayScreen: View {
    
    @Binding var courseList : [course]
    @State var todayList = [course]()
    @State var calender = Calendar.current
    @State var date = Date()
    
    var body: some View {
        
        if todayList.isEmpty{
                Spacer()
                Text("No Classes Today")
                .font(.largeTitle)
                .onAppear{
                    todayList = TodayList()
                }
                Spacer()
            
        }else{
            
            ScrollView(.vertical, showsIndicators: false){
                Text("Today")
                    .font(.largeTitle)
        
                    ForEach(todayList){
                        course in
                        ZStack{
                            courseBox(thisCourse: course)
                        }
                    }
            }
            .onAppear{
                todayList = TodayList()
            }
            
        }
    }
    
    func TodayList()->[course]{
        
        let day = calender.component(.weekday, from: date)
        var TodaysList : [course] = []
        
        for course in courseList {
            
            if day == 2{
                if course.days.contains("M"){TodaysList.append(course)}
            }
            if day == 3{
                if course.days.contains("T"){TodaysList.append(course)}
            }
            if day == 4{
                if course.days.contains("W"){TodaysList.append(course)}
            }
            if day == 5{
                if course.days.contains("T"){TodaysList.append(course)}
            }
            if day == 6{
                if course.days.contains("F"){TodaysList.append(course)}
            }
            
        }
        return TodaysList
    }
}


