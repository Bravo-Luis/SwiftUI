//
//  courseBox.swift
//  CourseApp
//
//  Created by Luis Bravo on 7/18/22.
//

import SwiftUI

struct courseBox: View {
    
    var thisCourse : course
    var width = UIScreen.main.bounds.width - 30
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(thisCourse.color))
            
            VStack{
                HStack{
                    Text(thisCourse.courseName)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                }
                VStack{
                    Text(thisCourse.location)
                    Text(thisCourse.times)
                    Text(thisCourse.instructor)
                }
                .modifier(TextStyle())
            }
            .padding(.vertical)
        }
        .frame(minWidth: width, idealWidth: width, maxWidth: width, minHeight: nil, idealHeight: nil, maxHeight: nil, alignment: .center)
        
    }
}


struct TextStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(Color(.black).opacity(0.6))
    }
    
    
}

struct courseBox_Previews: PreviewProvider {
    static var previews: some View {
        courseBox(thisCourse: course(courseName: "CS 40", days: "MWTRF", times: "12:30 - 1:45", location: "HFF 1425", instructor: "Aditya Mohan", color: "courseBlue"))
    }
}
