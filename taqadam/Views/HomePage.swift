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
//    @State var myvalue: GetInfo?
    @State var myVslue: GetInfo?
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "customer-id":"4236465023",
        "x-api-key": "zqt__INTfwOKqCNm1oNcq3JXbjDXA1GJgRNBOYVseg"
    ]
   

   
    func getData()  {
        let urlString = "https://experimental.willow.vectara.io/v1/completions"
        
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("4236465023", forHTTPHeaderField: "customer-id")
            request.setValue("zqt__INTfwOKqCNm1oNcq3JXbjDXA1GJgRNBOYVseg", forHTTPHeaderField: "x-api-key")
//        let prompt = "What kind of skills a \(JobTitle) at \(CompanyName) Company in \(Country) that i could do to get this job step by step??"
        let prompt = "what is the capital city of saudi arabia?"
        let requestInput = RequestInput(model: "text-davinci-003", prompt: prompt, max_tokens: 256, temperature: 0)
        
        encoder.outputFormatting = .prettyPrinted
        let body = try! encoder.encode(requestInput)
        request.httpBody = body
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        print(String(data: data, encoding: .utf8))
                        let response = try decoder.decode(GetInfo.self, from: data)
                        myVslue = response
                        print(JobTitle)
                        print(CompanyName)
                        print(Country)
                        print(response)
                        
                    } catch(let error) {
                        print(error.localizedDescription)
                    }
                }
            }
          
        }.resume()
    }

    
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
                    getData()
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
                
                Text(myVslue?.choices[0].text ?? "\n\nRiyadh is the capital city of Saudi Arabia.")
        
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


