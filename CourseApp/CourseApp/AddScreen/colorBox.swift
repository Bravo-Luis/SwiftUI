//
//  colorBox.swift
//  CourseApp
//
//  Created by Luis Bravo on 7/18/22.
//

import SwiftUI

struct colorBox: View {
    
    var thisColor : String
    var chosenColor : String
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(Color(.black))
            
            RoundedRectangle(cornerRadius: 2)
                .frame(width: 24, height: 24, alignment: .center)
                .foregroundColor((Color(thisColor)))
        }
        
    }
}

