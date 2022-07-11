//
//  Resources.swift
//  codepath@ucsb
//
//  Created by Luis Bravo on 7/2/22.
//

import SwiftUI

struct Resources: View {
    @State var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    var body: some View {
    
        VStack{
            //App Name Bar
            HStack(spacing: 20) {
                Text("Resources")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
                
            }
                .padding(.horizontal)
                .padding(.top,top)
                .background(Color("codepath_green"))
            
            
            
            //Content
            ScrollView(.vertical, showsIndicators: false) {
                
                
            }
            
        }
        
    }
}

struct Resources_Previews: PreviewProvider {
    static var previews: some View {
        Resources()
    }
}
