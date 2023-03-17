//
//  jobInfo.swift
//  taqadam
//
//  Created by Alaa Alabdullah on 17/03/2023.
//

import SwiftUI

struct jobInfo: View {
    
    var home: HomePage = HomePage()
    var body: some View {
        
        Text(home.myVslue?.choices[0].text ?? "\n\nRiyadh is the capital city of Saudi Arabiahhhhhh")
    }
}


