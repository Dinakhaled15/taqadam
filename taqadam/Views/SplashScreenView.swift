//
//  SplashScreenView.swift
//  taqadam
//
//  Created by Aljwhra Alnasser on 17/03/2023.
//

import SwiftUI

struct SplashScreenView: View {
    @AppStorage("ShowOnboarded") var ShowOnboarded: Bool = true
    @State private var isEnded = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    
    var body: some View {
        
        
        if isEnded{
            if ShowOnboarded {
                OnbordingView()
            } else {
           HomePage()
            }
        }else {
           
            ZStack{
                Color.color
                VStack{
                   Image("logo")
                  
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    
                    withAnimation{
                        self.isEnded = true
                    }
                }
            }
           
     
            .ignoresSafeArea()
           
        }
        
        
            
     
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
