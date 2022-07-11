//
//  Home.swift
//  codepath@ucsb
//
//  Created by Luis Bravo on 7/1/22.
//
import Foundation
import SwiftUI
import Alamofire

struct Home: View {
    
    @State var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    @State var postsArray = [post]()
    
    @State private var ipv4 : String = ""
    
    func loadData() {
            guard let url = URL(string: ipv4 + ":8081/fetch") else {
                print("Invalid URL")
                return
            }
            let request = URLRequest(url: url)

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    if let response = try? JSONDecoder().decode([post].self, from: data) {
                        DispatchQueue.main.async {
                            self.postsArray = response.reversed()
                        }
                        return
                    }
                }
            }.resume()
        }
    
    var body: some View {
        VStack{
            //App Name Bar
            
           HStack(spacing: 0) {
                Text("Announcements")
                 .font(.largeTitle)
                 .fontWeight(.heavy)
                 .foregroundColor(Color(.white))
                
               Spacer(minLength: 0)
              }
                .padding(.horizontal)
                .padding(.top,top)
                
                .background(Color("codepath_green"))
                
                Spacer(minLength: 0)
                
            
            //Content
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    ForEach(postsArray, id: \._id) { post in
                        
                        ZStack{
                            Rectangle()
                                .fill()
                                .foregroundColor(Color("post_grey"))
                            VStack {
                                Spacer(minLength: 5)
                                HStack{
                                    Text(post.title)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .padding(.leading,8)
                                        .foregroundColor(Color("text"))
                                        
                                    Spacer()
                                    Text(post.date)
                                        .font(.caption)
                                        .padding(.trailing,5)
                                        .foregroundColor(Color("text").opacity(0.2))
                                        
                                    
                                }
                                Spacer(minLength: 2)
                                Text(post.description)
                                    .font(.footnote)
                                    .padding(3)
                                    .foregroundColor(Color("text").opacity(0.8))
                                Spacer(minLength: 3)
                            }
                            
                        }
                        Spacer(minLength: 3)
                            
                    }
                }
                
            }.onAppear(perform: loadData)
            
        }
        
        
        
    }
    
}

struct post : Codable {
    var _id : String
    var title : String
    var date : String
    var description : String
}


