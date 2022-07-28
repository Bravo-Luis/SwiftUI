//
//  colorList.swift
//  CourseApp
//
//  Created by Luis Bravo on 7/18/22.
//

import SwiftUI

struct colorList: View {
    
    @Binding var ChosenColor : String
    @State var listOfColors = ["courseGray", "courseRed", "courseOrange","courseYellow", "courseGreen", "courseBlue", "courseBrown"]
    
    var body: some View {
        
        HStack{
            
            ForEach(listOfColors, id: \.self){
                color in
                
                if ChosenColor == color {
                    colorBox(thisColor: color , chosenColor: ChosenColor)
                        .onTapGesture {
                            ChosenColor = color
                        }
                        .overlay(Image(systemName: "checkmark"))
                }else{
                    colorBox(thisColor: color, chosenColor: ChosenColor)
                        .onTapGesture {
                            ChosenColor = color
                        }
                }
                
            }
            
        }
        .frame(width: UIScreen.main.bounds.width, height: 50, alignment: .center)
        
    }
}
