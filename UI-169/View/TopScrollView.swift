//
//  TopScrollView.swift
//  UI-169
//
//  Created by にゃんにゃん丸 on 2021/04/28.
//

import SwiftUI

struct TopScrollView: View {
    @State var ScrollOffset : CGFloat = 0
    @State var StartOffset : CGFloat = 0
    @State var isScrollTop = false
    var body: some View {
        ScrollViewReader { scrollReader in
            ScrollView{
                
                VStack(spacing:25){
                    
                    
                    ForEach(1...30,id:\.self){index in
                        
                       
                        
                        HStack(spacing:15){
                            
                          
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.gray.opacity(0.5))
                                .frame(width: 60, height: 60)
                            
                            VStack(alignment: .leading
                                   , spacing: 15, content: {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 22)
                                    
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.gray.opacity(0.3))
                                        .frame(height: 22)
                                        .padding(.trailing,100)
                                        
                                    
                                    
                                    
                            })
                            
                        }
                        
                        
                    }
                    
                    
                    
                }
                .padding()
                .id("SCROLL_TOP")
                .overlay(
                
                    GeometryReader{proxy -> Color in
                        
                        DispatchQueue.main.async {
                            if ScrollOffset == 0{
                                
                                self.StartOffset = proxy.frame(in: .global).minY
                                
                                
                               
                                
                                
                            }
                            let offset = proxy.frame(in: .global).minY
                            
                            self.ScrollOffset = offset - ScrollOffset
                        }
                        
                        return Color.clear
                        
                        
                        
                    }
                    
                )
                
            }
            .overlay(
            
                Button(action: {
                    
                    withAnimation(.spring()){
                        
                    isScrollTop = true
                        scrollReader.scrollTo("SCROLL_TOP", anchor: .top)
                        
                    }
                    
                    DispatchQueue.main.async {
                        isScrollTop = false
                    }
                    
                    
                }, label: {
                   Image(systemName: "arrow.up")
                    .font(.system(size: 30, weight: .heavy))
                    .foregroundColor(Color(#colorLiteral(red: 0.0005215686275, green: 0.0005215686275, blue: 0.0005215686275, alpha: 1)))
                    .padding()
                    .background(Color.red.opacity(0.3))
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                })
                .padding(.top,getSafeArea().top == 0 ? 15 : 0)
                 .opacity(-ScrollOffset > 450 ? 1 : 0)
                .animation(.easeOut)
                .disabled(isScrollTop)
                
                ,alignment: .top
            
        )
        }
        
    }
}

struct TopScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TopScrollView()
    }
}
