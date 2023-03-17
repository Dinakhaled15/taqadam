//
//  HomePage.swift
//  taqadam
//
//  Created by hoton on 25/08/1444 AH.
//
 
import SwiftUI

struct HomePage: View {
    @State var JobTitle = ""
    @State var CompanyName = ""
    @State var Country = ""
    
    var body: some View {
        VStack(spacing : 20){
            Image("MainpagePic")
            Text("Hello, I’m here to help you get the career that you want")
                .foregroundColor(.color)
                .font(.system(size: 26))
                .multilineTextAlignment(.center)
                .padding(.horizontal,15)
                .padding(.vertical,30)
            
            TextField("Enter The Job Title", text: $JobTitle)
                .textFieldStyle(CaptionTextFieldStyle())
                .padding(.horizontal)
            
            TextField("Enter the name of the Company", text: $CompanyName)
                .textFieldStyle(CaptionTextFieldStyle())
                .padding(.horizontal)
            
            TextField("Enter the Country desired", text: $Country)
                .textFieldStyle(CaptionTextFieldStyle())
                .padding(.horizontal)
            
         Spacer()
            Button{
                
            }label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.color)
                        .frame(height: 55)
                        .cornerRadius(14)
                    Text("Result")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                }.padding(.horizontal)
            }
            .padding(.bottom)
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
