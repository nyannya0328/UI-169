//
//  TextView.swift
//  UI-169
//
//  Created by にゃんにゃん丸 on 2021/04/28.
//

import SwiftUI

struct TextView: View {
    @StateObject var model = TFManeger()
    
    @State var isTaped = false
    var body: some View {
        VStack{
            
            VStack{
                
                
                TextField("", text: $model.txt) { (statas) in
                    
                    if statas{
                        
                        withAnimation(.easeOut){
                            
                            isTaped = true
                            
                        }
                        
                    }
                    
                } onCommit: {
                    
                   
                        
                    if model.txt == ""{
                        withAnimation(.easeOut){
                            
                            isTaped = false
                            
                        }
                    }
                   
                 }
                .padding(.top,isTaped ? 15 : 0)
                .background(
                
                Text("User Name")
                    .font(.none)
                    
                    .scaleEffect(isTaped ? 0.8 : 1)
                    .offset(x: isTaped ? -7 : 0, y: isTaped ? -15 : 0)
                    .foregroundColor(isTaped ? .accentColor : .gray)
                    
                    ,alignment: .leading
                       
                
                )
                .padding(.horizontal)
                
                Rectangle()
                
                    .fill(isTaped ? Color.accentColor : Color.gray)
                    .opacity(isTaped ? 1 : 0.5)
                    .frame(height: 1)
                    .padding(.top,10)
                
                
        }
            .padding(.top,12)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(5)
            
            HStack{
                
                Spacer()
                
                
                Text("\(model.txt.count)/15")
                    .font(.callout)
                    .foregroundColor(.gray)
                    .padding(.trailing)
                    .padding(.top,10)
            }
            .padding()
            
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}

class TFManeger : ObservableObject{
    
    
    @Published var txt = ""{
        
        didSet{
            
            if txt.count > 15 && oldValue.count <= 15{
                
                txt = oldValue
            }
            
        }
        
        
        
    }
}
}
