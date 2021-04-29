//
//  TabButton.swift
//  UI-169
//
//  Created by にゃんにゃん丸 on 2021/04/28.
//

import SwiftUI

struct TabButton: View {
    var title : String
    var image : String
    @Binding var selected : String
    
    var animation : Namespace.ID

    var body: some View {
        Button(action: {
            
            withAnimation(.spring()){
                
                
                selected = title
            }
            
        }, label: {
            HStack(spacing:15){
                
                Image(systemName: image)
                    .font(.title2)
                    .frame(width: 30)
                
                Text(title)
                    .fontWeight(.bold)
                
                
                
            }
            .foregroundColor(selected == title ? .blue : .white)
            .padding(.vertical,10)
            .padding(.horizontal,10)
          .frame(width: getRect().width, alignment: .leading)
            .background(
            
                ZStack{
                    
                    if selected == title{
                        
                        Color.white.opacity(selected == title ? 1 : 0)
                            .clipShape(CustomShape(corner: [.topLeft,.topRight], radi: 12))
                            .matchedGeometryEffect(id: "TAB", in: animation)
                        
                    }
                }
            
            )
        })
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomShape : Shape {
    var corner : UIRectCorner
    var radi : CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radi, height: radi))
        
        return Path(path.cgPath)
    }
}
