//
//  CustomShape.swift
//  UI-169
//
//  Created by にゃんにゃん丸 on 2021/04/28.
//

import SwiftUI

struct CustomShape2: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let midWith = rect.width / 2
            path.addLine(to: CGPoint(x: midWith - 80, y: rect.height))
            path.addLine(to: CGPoint(x: midWith - 70, y: rect.height - 50))
            
            path.addLine(to: CGPoint(x: midWith + 70, y: rect.height-50))
            path.addLine(to: CGPoint(x: midWith + 80, y: rect.height))
            
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        
            
            
            
        }
    }
}

struct CustomShape_Previews: PreviewProvider {
    static var previews: some View {
      TripView()
    }
}
