//
//  SlideTabButton.swift
//  UI-169
//
//  Created by にゃんにゃん丸 on 2021/04/28.
//

import SwiftUI

struct SlideTabButton: View {
    @Namespace var animation
    @Binding var selected : String
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            
            
            Image("pro")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .cornerRadius(10)
                .padding(.top,50)
            
            
            VStack(alignment: .leading, spacing: 15, content: {
                Text("Risa Desmond")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("View Profile")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .opacity(0.7)
                })
                
                VStack(alignment: .leading, spacing: 15, content: {
                    
                    
                   
                        
                        
                        TabButton(title: "Home", image: "house.circle", selected: $selected, animation: animation)
                        
                        TabButton(title: "Clock", image: "clock.fill", selected: $selected, animation: animation)
                        
                        TabButton(title: "Heart", image: "heart.fill", selected: $selected, animation: animation)
                        
                        TabButton(title: "Smile", image: "face.smiling.fill", selected: $selected, animation: animation)
                        
                   
                })
                .padding(.leading,-15)
                .padding(.top,50)
                
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10, content: {
                    TabButton(title: "Log Out", image: "rectangle.righthalf.inset.fill.arrow.right", selected:.constant("") , animation: animation)
                        .padding(.leading,-15)
                    
                    
                    Text("App Version 1.2.3")
                        .font(.footnote)
                        .foregroundColor(.white)
                        .kerning(1)
                        .opacity(0.6)
                        .padding(.leading,-5)
                        
                   
                })
                
                
                
                
                
                
                
            })
            
            
            
            
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment:
                .topLeading)
    }
}

struct SlideTabButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
