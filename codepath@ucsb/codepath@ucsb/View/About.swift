//
//  About.swift
//  codepath@ucsb
//
//  Created by Luis Bravo on 7/2/22.
//

import SwiftUI

struct About: View {
    @State var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    var body: some View {
        
        VStack{
            HStack(spacing: 20) {
                Text("Information")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
                
            }
                .padding(.horizontal)
                .padding(.top,top)
                .background(Color("codepath_green"))
            Spacer(minLength: 0)
            
            
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    //Text("***Not just a club, a community***")
                        //.font(.headline)
                        //.foregroundColor(Color("text"))
                        //.padding(.top)
                        
                        
                   // Text("With the goal of lowering barriers for students with less access to coding resources, especially those not very represented in the coding world; low-income, minorities, non-male, ect.")
                        //.font(.footnote)
                        //.foregroundColor(Color("text"))
                        //.multilineTextAlignment(.center)
                       // .padding(.top,1)
                       // .padding(.leading)
                       // .padding(.trailing)
                    
                        Text("Socials")
                            .font(.body)
                            .foregroundColor(Color("text"))
                            .padding(.top,8)
                            
                    Text("email: email")
                        .font(.caption)
                        .foregroundColor(Color("text"))
                    Text("discord: {invite link goes here}")
                        .font(.caption)
                        .foregroundColor(Color("text"))
                    Text("instagram: {link goes here}")
                        .font(.caption)
                        .foregroundColor(Color("text"))
                        
                    
                }
                Spacer(minLength: 500)
                VStack{
                    
                    Text("App made by Luis Bravo")
                        .font(.caption2)
                        .foregroundColor(Color("text"))
}

            }
        }
    }
}

