//
//  jobInfo.swift
//  taqadam
//
//  Created by Alaa Alabdullah on 17/03/2023.
//

import SwiftUI

struct jobInfo: View {
    @StateObject var getdata : functions = functions()
    
    var body: some View {
        
        VStack{

                Text("To Become A \(getdata.JobTitle):")
                    .font(.title)
                    .scaledToFit()
                    .minimumScaleFactor(0.01)
                    .padding()
            
            if(getdata.myVslue?.choices[0].text == nil){
                ProgressView()
            }else{
            
                Text(getdata.array![1])
                    
                Text("the next")
                
            }

           
            
        }.onAppear{
            getdata.getData()
            print("here")
          //  print(getdata.myVslue?.choices[0].text)
        }
        
    }
}


