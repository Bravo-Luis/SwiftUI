//
//  timeScroller.swift
//  CourseApp
//
//  Created by Luis Bravo on 7/18/22.
//

import SwiftUI

struct timeScroller: View {
    
    @Binding var startTime : Date
    @Binding var endTime : Date
    @State private var width = UIScreen.main.bounds.width - 345
    var body: some View {
        
        VStack{

            HStack{
                DatePicker("Start:", selection: $startTime, displayedComponents: .hourAndMinute)
                    .frame(alignment: .leading)
                Spacer(minLength: width)
                DatePicker("End:", selection: $endTime, displayedComponents: .hourAndMinute)
                    .frame(alignment: .trailing)
            }.padding(.horizontal)
                .padding(.bottom)
            
            
        }
        
    }
}

