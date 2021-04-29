//
//  PageController.swift
//  UI-169
//
//  Created by にゃんにゃん丸 on 2021/04/28.
//

import SwiftUI

struct PageController: UIViewRepresentable {
    var maxPage : Int
    var currentPage : Int
    
    func makeUIView(context: Context) -> UIPageControl {
        
        let control = UIPageControl()
        control.backgroundStyle = .prominent
        control.numberOfPages = maxPage
        control.currentPage = currentPage
        
        return control
        
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
        
    }
}
