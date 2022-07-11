//
//  ContentView.swift
//  codepath@ucsb
//
//  Created by Luis Bravo on 7/1/22.
//

import SwiftUI

struct ContentView: View {
    @State var current = "house.fill"
    @Namespace var animation
    
    var body: some View {
        
        ZStack{
            
            VStack{
                if current == "house.fill"
                {Home()
                        
                }
                //if current == "tv.fill" {Resources()}
                else if current == "person.2.fill" {About()
                        
                }
                    
                    
                HStack{
                    //Nav(current: $current, image: "tv.fill", animation: animation)
                    Nav(current: $current, image: "house.fill", animation: animation)
                    Nav(current: $current, image: "person.2.fill", animation: animation)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


