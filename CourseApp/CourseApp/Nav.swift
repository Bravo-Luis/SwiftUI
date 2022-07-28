//
//  Nav.swift
//  CourseApp
//
//  Created by Luis Bravo on 7/19/22.
//

import SwiftUI

struct Nav: View {
    
    @Binding var current : String
    var image : String
    var animation : Namespace.ID
    
    var body: some View {
        
        Button(action: {
            withAnimation{current = image}
        }) {
            
            VStack(spacing:5){
                
                ZStack {
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height:4)
                    
                }
                
                Image(systemName: image)
                    .font(.title2)
                    .foregroundColor(current == image ? Color(.black) : Color(.systemGray).opacity(0.6))
                    .frame( height: 35)
                
                
            }
            
        }
    }
}

