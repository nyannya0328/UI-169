//
//  Home.swift
//  UI-169
//
//  Created by にゃんにゃん丸 on 2021/04/28.
//

import SwiftUI

struct Home: View {
    @Binding var selectedTab : String
    init(slectedtab:Binding<String>) {
        
        self._selectedTab = slectedtab
        
        UITabBar.appearance().isHidden = true
        
    }
    
    var body: some View {
        TabView(selection:$selectedTab){
            
            TripView()
                .tag("Home")
                
            
            TopScrollView()
                .tag("Clock")
           TextView()
                .tag("Heart")
            Color.orange
                .tag("Smile")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
