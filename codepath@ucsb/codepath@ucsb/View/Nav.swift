//
//  Nav.swift
//  codepath@ucsb
//
//  Created by Luis Bravo on 7/1/22.
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
                    
                    if current == image {
                        Rectangle()
                            .fill(Color("codepath_green"))
                            .frame(height:5)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                }
                
                Image(systemName: image)
                    .font(.title2)
                    .foregroundColor(current == image ? Color("codepath_green") : Color("text").opacity(0.3))
                    .frame( height: 35)
                
                
            }
            
        }
        
    }
}


