//
//  ContentView.swift
//  UI-169
//
//  Created by にゃんにゃん丸 on 2021/04/28.
//

import SwiftUI

struct ContentView: View {
    @State var next = false
    var body: some View {
        
        ZStack{
            if next{
            
        MainView()
            }
            
            else{
            
            OnBoardScreen()
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("NEXT")), perform: { _ in
            withAnimation{
                
                self.next = true
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct OnBoardScreen : View {
    @State var offset : CGFloat = 0
    
    @State var maxWith = UIScreen.main.bounds.width - 100
    var body: some View{
    
        ZStack{
            
            
            Color.orange.ignoresSafeArea()
                .ignoresSafeArea()
            
            
            VStack{
                
                Text("Drag Screen")
                    .font(.largeTitle)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text("Welcome")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding(.top,5)
                
                
                Image("pro")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getRect().width, height: getRect().height / 2)
                    .clipShape(Circle())
                
                Spacer(minLength: 0)
                
                
                
                ZStack{
                    
                Capsule()
                    .fill(Color.green.opacity(0.3))
                    
                    Text("Lets Start")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.leading,20)
                    
                    HStack{
                        
                        Capsule()
                            .fill(Color.purple)
                            .frame(width: CaluculateWidth() + 63)
                        Spacer()
                        
                    }
                    
                    
                    
                    HStack{
                        
                        
                        ZStack{
                            
                            Image(systemName: "chevron.right")
                            
                            Image(systemName: "chevron.right")
                                .offset(x: -10)
                            
                            
                        }
                        .foregroundColor(.white)
                        .frame(width: 65, height: 65)
                        .background(Color.red)
                        .clipShape(Circle())
                        .offset(x: offset)
                        .gesture(DragGesture().onChanged(Onchanged(value:)).onEnded(OnEnded(value:)))
                        
                        
                        
                        Spacer()
                       
                    }
                    
                    
                }
                .frame(width: getRect().width - 100, height: 65)
                .padding(.bottom)
                    
                
                
            }
            
        }
    
    }
    
    
    func CaluculateWidth()->CGFloat{
        
        
        let progress = offset / maxWith
        
        return progress * maxWith
        
        
    }
    
    
    func Onchanged(value:DragGesture.Value){
        if value.translation.width > 0 && offset <= getRect().width - 100 - 65 {
            
            offset = value.translation.width
            
        }
        
        
    }
    
    func OnEnded(value:DragGesture.Value){
        
        
        withAnimation(.easeOut){
            
            if offset > 180{
                
                
                offset = maxWith - 63
                
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name:Notification.Name("NEXT"),object: nil)
                }
                
                
                
            }
            else{
                
                offset = 0
                
            }
            
            
        }
        
        
        
    }
    
    }

