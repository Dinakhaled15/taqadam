//
//  HomePage.swift
//  taqadam
//
//  Created by hoton on 25/08/1444 AH.
//
 
import SwiftUI
import Alamofire



struct HomePage: View {
  
    @State var JobTitle = ""
    @State var CompanyName = ""
    var checkRequiredField :Bool{
     if JobTitle.isEmpty || CompanyName.isEmpty {
            return true
        }
        return false
    }
    
    @StateObject var getdata : functions = functions()
  
    

    var body: some View {
        NavigationView {
            
            ScrollView{
                Image("MainpagePic")
                    .resizable()
                    .frame(height: 230)
                VStack(spacing : 20){
                    Text("Hello, I'm here to help you find the skills for your desired job")
                        .foregroundColor(.color)
                        .font(.system(size: 26))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,13)
                        .padding(.vertical,30)
                    
                    TextField("Enter the job title", text: $JobTitle)
                        .textFieldStyle(CaptionTextFieldStyle())
                    
                    TextField("Enter the name of the company", text: $CompanyName)
                        .textFieldStyle(CaptionTextFieldStyle())
                    
                    
                    Spacer()
                    
                    NavigationLink{
                        jobInfo.init(JobTitle: $JobTitle, componyName: $CompanyName)
                    }label: {
                        ZStack{
                            Rectangle()
                                .foregroundColor(checkRequiredField ?  .gray : .color)
                                .frame(height: 55)
                                .cornerRadius(14)
                            Text("Result")
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                        }
                    }.disabled(checkRequiredField)
                    .padding(.top,35)
         
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
                    .foregroundColor(Color.color)
            )
        
    }
}


