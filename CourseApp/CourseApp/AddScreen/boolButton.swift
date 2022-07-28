//
//  boolButton.swift
//  CourseApp
//
//  Created by Luis Bravo on 7/18/22.
//

import SwiftUI

struct boolButton: View {

    @Binding var day : Bool
    var show : String
    
    var body: some View {
        
        if day{
            Button(show){
                day.toggle()
            }
            .font(.title)
            .foregroundColor(Color(.systemBlue))
        } else {
            Button(show){
                day.toggle()
            }
            .font(.title3)
            .foregroundColor(Color("TextColor"))
        }
        
    }
}


