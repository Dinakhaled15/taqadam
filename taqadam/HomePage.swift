//
//  HomePage.swift
//  taqadam
//
//  Created by hoton on 25/08/1444 AH.
//

import SwiftUI

struct HomePage: View {
    @State var Name = ""
    var body: some View {
        VStack{
            Image("MainpagePic")
            Text("Hello, I’m here to help you get the career that you want")
                .foregroundColor(.blue)
                .font(.system(size: 26))
                .multilineTextAlignment(.center)
                .padding(.horizontal,15)
            
            TextField("Enter the name ", text: $Name)
                .textFieldStyle(CaptionTextFieldStyle())
                .padding(.horizontal)

            Button{
                
            }label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(height: 55)
                        .cornerRadius(14)
                    Text("Result")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                }.padding(.horizontal)
            }
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
                    .foregroundColor(Color.blue)
            )
        
    }
}
