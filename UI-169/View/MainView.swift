//
//  MainView.swift
//  UI-169
//
//  Created by にゃんにゃん丸 on 2021/04/28.
//

import SwiftUI

struct MainView: View {
   
        @State var selected = "house.circle"
    @State var showMenu = false
    
    var body: some View {
        ZStack{
            
            Color.blue
                .ignoresSafeArea()
            
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false, content: {
                SlideTabButton(selected: $selected)
            })
            
            
            ZStack{
                
                Color.white.opacity(0.7)
                    .cornerRadius(showMenu ? 15 : 0)
                    .shadow(color: Color.black.opacity(0.7), radius: 5, x: -5, y: 5)
                    .offset(x: showMenu ? -25 : 0)
                    .padding(.vertical,30)
                
                Color.white.opacity(0.7)
                    .cornerRadius(showMenu ? 15 : 0)
                    .shadow(color: Color.black.opacity(0.7), radius: 5, x: -5, y: 5)
                    .offset(x: showMenu ? -50 : 0)
                    .padding(.vertical,60)
                
                
                Color.white.opacity(0.7)
                    .cornerRadius(showMenu ? 15 : 0)
                    .shadow(color: Color.black.opacity(0.7), radius: 5, x: -5, y: 5)
                    .offset(x: showMenu ? -75 : 0)
                    .padding(.vertical,90)
                
                Color.white.opacity(0.7)
                    .cornerRadius(showMenu ? 15 : 0)
                    .shadow(color: Color.black.opacity(0.7), radius: 5, x: -5, y: 5)
                    .offset(x: showMenu ? -95 : 0)
                    .padding(.vertical,120)
                
                
                Home(slectedtab: $selected)
                    .cornerRadius(showMenu ? 5 : 0)
                    
               
                    
            }
                    
                    .scaleEffect(showMenu ? 0.86 : 1)
                    .offset(x:showMenu ? getRect().width - 120 : 0 )
                    .ignoresSafeArea()
                
                    .overlay(
                    
                    
                        Button(action: {
                            
                            withAnimation(.spring()){
                                
                                
                                showMenu.toggle()
                            }
                            
                        }, label: {
                            VStack(spacing:5){
                                
                                Capsule()
                                    .fill(showMenu ? Color.white : Color.primary)
                                    .frame(width: 30, height: 3)
                                    .rotationEffect(.init(degrees: showMenu ? -50 : 0))
                                    .offset(x: showMenu ? 2 : 0, y: showMenu ? 9 : 0)
                                
                                VStack(spacing:5){
                                    
                                    Capsule()
                                        .fill(showMenu ? Color.white : Color.primary)
                                        .frame(width: 30, height: 3)
                                    
                                    Capsule()
                                        .fill(showMenu ? Color.white : Color.primary)
                                        .frame(width: 30, height: 3)
                                        .offset(y: showMenu ? -8 : 0)
                                        
                                    
                                    
                                    
                                    
                                }
                                .rotationEffect(.init(degrees: showMenu ? 50 : 0))
                                
                                
                            }
                           
                           
                            
                        })
                        .padding()
                    
                        ,alignment: .topLeading
                    )
                
                
                
            
            
           
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension View {
    
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
    
    func getSafeArea()->UIEdgeInsets{
        
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
