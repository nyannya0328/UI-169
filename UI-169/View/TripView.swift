//
//  TripView.swift
//  UI-169
//
//  Created by にゃんにゃん丸 on 2021/04/28.
//

import SwiftUI

struct TripView: View {
    @State var selectedTab : Trip = trips[0]
    var body: some View {
        ZStack{
            
            GeometryReader{proxy in
                
                let frame = proxy.frame(in:.global)
                
                Image(selectedTab.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: frame.width, height: frame.height)
                    .cornerRadius(0)
                    
                    
                
                
            }
            .ignoresSafeArea()
            
            VStack{
                
                Text("Lets Go With")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                
                Text("PocoTrip")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.bottom,30)
                
                
                VStack{
                    GeometryReader{proxy in
                        
                        
                        let frame = proxy.frame(in:.global)
                        
                        TabView(selection:$selectedTab){
                            
                            
                            ForEach(trips){trip in
                                
                                Image(trip.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: frame.width - 10, height: frame.height)
                                    .cornerRadius(4)
                                    .tag(trip)
                                
                            }
                            
                            
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                        
                        
                        
                    }
                    .frame(height: getRect().height / 2.3)
                    
                    Text(selectedTab.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top,20)
                        .padding(.bottom,18)
                    
                    
                    PageController(maxPage: trips.count, currentPage: getIndex())
                    
                    
                    
                }
                .padding(.top,10)
                .padding(.horizontal,10)
                .padding(.bottom)
                .background(Color.white.clipShape(CustomShape2()))
                .cornerRadius(20)
                .padding(.horizontal)
                
                
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Get Started")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal,30)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.6))
                        .cornerRadius(10)
                })
                .padding(.top,20)
                .padding(.horizontal)
                
                    
                
            }
            .padding()
            
            
        }
    }
    func getIndex()->Int{
        
        let index = trips.firstIndex { trip in
           
            selectedTab.id == trip.id
        } ?? 0
        
        return index
        
        
    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView()
    }
}
