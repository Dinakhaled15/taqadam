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
           
            Text(getdata.myVslue?.choices[0].text ?? "error")
            
        }.onAppear{
            getdata.getData()
        }
        
    }
}


