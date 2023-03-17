//
//  HomePage.swift
//  taqadam
//
//  Created by hoton on 25/08/1444 AH.
//

import SwiftUI
import Alamofire



struct HomePage: View {
    @State var showSecondPage: Bool = false
    @State var JobTitle = "software engineer"
    @State var CompanyName = "aramco"
    @State var Country = "Saudi Arabia"
    @StateObject var getdata : functions = functions()
//    @State var myvalue: GetInfo?
 //   @State var myVslue: GetInfo?
 //   let encoder = JSONEncoder()
   // let decoder = JSONDecoder()
    
   
   



    
    var body: some View {
        ScrollView{
            Image("MainpagePic")
                .resizable()
                .frame(height: 230)
            VStack(spacing : 20){
                Text("Hello, I’m here to help you get the career that you want")
                    .foregroundColor(.color)
                    .font(.system(size: 26))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,15)
                    .padding(.vertical,30)
       
                TextField("Enter the job title", text: $JobTitle)
                    .textFieldStyle(CaptionTextFieldStyle())
        
                TextField("Enter the name of the company", text: $CompanyName)
                    .textFieldStyle(CaptionTextFieldStyle())
               
                
                TextField("Enter the country desired", text: $Country)
                    .textFieldStyle(CaptionTextFieldStyle())
            
                Spacer()
           
                Button{
                    guard !JobTitle.isEmpty && !CompanyName.isEmpty else { return }
                    getdata.getData()
                  showSecondPage = true
                }label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.color)
                            .frame(height: 55)
                            .cornerRadius(14)
                        Text("Result")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                    }
                }
                .padding(.top,35)
                .fullScreenCover(isPresented: $showSecondPage) {
                    jobInfo()
                }
               
            }.padding(.horizontal)
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

struct CaptionTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(lineWidth: 0.7)
                    .foregroundColor(Color.color)
            )
        
    }
}


