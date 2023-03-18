//
//  jobInfo.swift
//  taqadam
//
//  Created by Alaa Alabdullah on 17/03/2023.
//

import SwiftUI

struct jobInfo: View {
    @StateObject var getdata : functions = functions()
    @Binding var JobTitle :String
    @Binding var componyName :String
    var body: some View {
        
        VStack{
            
            Text("\(JobTitle) employee in \(componyName) have these skills :")
                .font(.title)
                .foregroundColor(.color)
                .scaledToFit()
                .minimumScaleFactor(0.01)
                .padding()
            
            if(getdata.myVslue?.choices[0].text == nil){
                ProgressView()
            }else{
                ScrollView {
                    ForEach(getdata.array! , id: \.self) { Element in
                        if Element == "" {
                            
                        } else {
                            Text(Element)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity , minHeight: 100)
                                .background(Color.white)
                                .cornerRadius(20)
                                .padding(.vertical, 7)
                                .padding(.horizontal)
                            
                        }
                        
                    }
                }
                
                
                
            }
            
            
            
        }.onAppear{
            getdata.getData(JobTitle: JobTitle, CompanyName: componyName)
            
        }
        
    }
}


