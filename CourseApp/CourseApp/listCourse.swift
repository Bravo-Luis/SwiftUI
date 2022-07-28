//
//  listCourse.swift
//  CourseApp
//
//  Created by Luis Bravo on 7/19/22.
//

import SwiftUI


struct listCourse: View {
    var inputCourse : course
    var ScreenWidth = (UIScreen.main.bounds.width - 80) / 5
    
    var body: some View {
        
        HStack{
            VStack{
                Text(inputCourse.courseName)
                    .font(.body.smallCaps().bold())
                Text(inputCourse.instructor)
                    .font(.footnote.smallCaps())
            }
            .frame(width: ScreenWidth * 2.25, alignment:.center)
            
            Spacer(minLength: 0)
            
            VStack{
                Text(inputCourse.location)
                    .font(.footnote.smallCaps())
                Text(inputCourse.times)
                    .font(.footnote.smallCaps())
            }
            .frame(width: ScreenWidth * 1.75, alignment:.center)
            
            Spacer(minLength: 0)
            
            VStack{
                Text(inputCourse.days)
                    .font(.footnote.smallCaps())
                    .padding(.trailing,3)
                    
            }
            .frame(width: ScreenWidth, alignment:.trailing)
        }
        
    }
}

struct listCourse_Previews: PreviewProvider {
    static var previews: some View {
        listCourse(inputCourse: course(courseName: "Course Name", days: "MTWRF", times: "12:00 - 12:00 PM", location: "HSHSJ 19882", instructor: "Prifeessor smallinsi", color: "courseGreen"))
    }
}
