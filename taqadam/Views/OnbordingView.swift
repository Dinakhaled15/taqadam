//
//  onbording.swift
//  taqadam
//
//  Created by hoton on 25/08/1444 AH.
//

import SwiftUI

struct OnbordingView: View {
    @AppStorage("ShowOnboarded") var ShowOnboarded: Bool = true
    var body: some View {
        VStack(alignment: .center){
            Spacer()
                Image("onbording")
                    .resizable()
                    .frame(width: 320 , height: 350)
                Text("Find the required skills in any company that you want")
                    .foregroundColor(.gray)
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,50)
             
          
                
             Spacer()
                Button{
                    withAnimation(.spring()) {
                        ShowOnboarded = false
                    }
                }label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.color)
                            .frame(height: 55)
                            .cornerRadius(14)
                        Text("Start")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                    }.padding(.horizontal)
                }
                .padding(.bottom)
            }
        
    }
}

struct OnbordingView_Previews: PreviewProvider {
    static var previews: some View {
        OnbordingView()
    }
}
